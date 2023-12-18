<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Controller;

use App\Entity\UserBook;
use App\Repository\BookRepository;
use App\Repository\StatusRepository;
use App\Repository\UserBookRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/userbook', name: 'app_userbook')]
class UserBookController extends AbstractController
{
    #[Route('/', name: '_index', methods: ['GET'])]
    public function index(UserBookRepository $userBookRepository): Response
    {
        return $this->render('userBook/index.html.twig', [
            'userBooks' => $userBookRepository->findAll(),
        ]);
    }

    #[Route('/add', name: '_add', methods: ['POST'])]
    public function add(
        StatusRepository $statusRepo,
        BookRepository $bookRepo,
        EntityManagerInterface $entityManager,
        Request $request
    ): Response {
        $bookId = $request->request->get('bookId');
        $book = $bookRepo->findOneById($bookId);
        $status = $statusRepo->findOneByName('A lire');

        $userBook = new UserBook();
        $userBook->setBook($book);
        $userBook->setUser($this->getUser());
        $userBook->setCreateAt(new \DateTimeImmutable());
        $userBook->setUpdatedAt(new \DateTimeImmutable());
        $userBook->setStatus($status);
        $userBook->setStatus($status);
        $userBook->setNote(0);
        $entityManager->persist($userBook);
        // dd($userBook);
        $entityManager->flush();

        return $this->redirectToRoute('app_book_show', ['id' => $book->getId()], Response::HTTP_SEE_OTHER);
    }

    #[Route('/{id}/edit', name: '_edit', methods: ['POST'])]
    public function edit(
        Request $request,
        UserBook $userBook,
        EntityManagerInterface $em,
        StatusRepository $statusRepo
    ): Response {
        $userBookData = $request->request;
        // dd($userBookData);
        $userBook->setCommentTitle($userBookData->get('commentTitle'));
        $userBook->setComment($userBookData->get('comment'));
        $userBook->setNote($userBookData->get('note'));
        $status = $statusRepo->findOneById($userBookData->get('status'));
        $userBook->setStatus($status);

        $em->persist($userBook);
        $em->flush();

        $book = $userBook->getBook();

        // return $this->json(['updated'=>'success',$userBookData],200);
        // return $this->render('userBook/edit.html.twig', [
        //     'userBook' => $userBookData,
        // ]);

        return $this->redirectToRoute('app_book_show', ['id' => $book->getId()], Response::HTTP_SEE_OTHER);
    }
}
