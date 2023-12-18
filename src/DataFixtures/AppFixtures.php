<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\DataFixtures;

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\Kind;
use App\Entity\Status;
use App\Entity\User;
use App\Entity\UserBook;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory as Faker;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Faker::create('fr_FR');

        // $userArray = ["admin@test.fr", "admin", "admin"];
        // $admin = new User;
        // $admin->setEmail($userArray[0]);
        // $admin->setPseudo($userArray[0]);
        // $admin->setPassword($userArray[0]);
        // $manager->persist($admin);

        // creation des status
        $statusArray = ['A lire', 'En cours', 'Lu', 'Abandonné'];
        $allStatus = [];
        for ($i = 0; $i < \count($statusArray); ++$i) {
            $status = new Status();
            $status->setName($statusArray[$i]);
            $manager->persist($status);
            $allStatus[] = $status;
        }

        // creation de genres litteraires
        $kinds = ['Roman', 'Policier', 'Bande dessinée', 'Science-fiction', 'Compte'];
        $allKinds = [];
        for ($i = 0; $i < \count($kinds); ++$i) {
            $kind = new Kind();
            $kind->setName($kinds[$i]);
            $kind->setColor($faker->hexColor());
            $kind->setBgColor($faker->hexColor());
            $manager->persist($kind);
            $allKinds[] = $kind;
        }

        // creation des auteurs
        $authors = [];
        for ($i = 0; $i < 10; ++$i) {
            $author = new Author();
            $author->setName($faker->name);
            $manager->persist($author);
            $authors[] = $author;
        }

        // creation des utilisateurs
        $users = [];
        for ($i = 0; $i < 10; ++$i) {
            $user = new User();
            $user->setEmail($faker->email);
            $user->setPseudo($faker->username);
            $user->setPassword($faker->password);
            $manager->persist($user);
            $users[] = $user;
        }

        // creation des livres
        $books = [];
        for ($i = 0; $i < 50; ++$i) {
            $book = new Book();
            $book
                ->setgoogleId($faker->uuid())
                ->setTitle($faker->sentence)
                ->setDescription($faker->text)
                ->setPageCount($faker->numberBetween(200, 800))
                ->setThumbnail($faker->imageUrl(200, 300))
                ->setAddedAt(new \DateTimeImmutable())
                ->setAddedBy($faker->randomElement($users))
                ->addKind($faker->randomElement($allKinds))
                ->addAuthor($faker->randomElement($authors));
            $manager->persist($book);
            $books[] = $book;
        }

        // creation des liste de lectures
        foreach ($users as $user) {
            for ($i = 0; $i < 10; ++$i) {
                $userBook = new UserBook();
                $userBook
                    ->setUser($user)
                    ->setStatus($faker->randomElement($allStatus))
                    ->setNote($faker->numberBetween(1, 5))
                    ->setCommentTitle($faker->sentence(3))
                    ->setComment($faker->text)
                    ->setCreateAt(new \DateTimeImmutable())
                    ->setBook($faker->randomElement($books));
                $manager->persist($userBook);
            }
        }

        $manager->flush();
    }
}
