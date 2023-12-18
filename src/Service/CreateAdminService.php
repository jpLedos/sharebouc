<?php

declare(strict_types=1);

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Service;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class CreateAdminService
{
    public function __construct(
        private readonly UserRepository $userRepository,
        private readonly UserPasswordHasherInterface $PasswordHasher
    ) {
    }

    public function create(string $email, string $pseudo, string $password)
    {
        $user = $this->userRepository->findOneBy(['email' => $email]);

        if (!$user) {
            $user = new User();
            $user->setEmail($email);
            $user->setPseudo($pseudo);
            $password = $this->PasswordHasher->hashPassword($user, $password);
            $user->setPassword($password);
        }

        $user->setRoles(['ROLE_ADMIN']);
        // dd($user);
        $this->userRepository->save($user, true);
    }
}
