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

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\Tag;
use App\Form\BookType;
use App\Repository\AuthorRepository;
use App\Repository\BookRepository;
use App\Repository\KindRepository;
use App\Repository\StatusRepository;
use App\Repository\TagRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\HttpClient\HttpClientInterface;

#[Route('/book')]
class BookController extends AbstractController
{
    #[Route('/', name: 'app_book_index', methods: ['GET'])]
    public function index(
        BookRepository $bookRepository,
        KindRepository $kindRepo,
        UserRepository $userRepo,
        StatusRepository $statusRepo
    ): Response {
        $books = $bookRepository->findBy([], ['AddedAt' => 'DESC']);
        $kinds = $kindRepo->findBy([], ['name' => 'ASC']);
        // dd($status);

        return $this->render('book/index.html.twig', [
            'books' => $books,
            'kinds' => $kinds,
            'users' => $userRepo->findAll(),
            'status' => $statusRepo->findAll(),
        ]);
    }

    #[Route('/add/{googleId}', name: 'app_book_add', methods: ['GET'])]
    public function add(
        BookRepository $bookRepo,
        TagRepository $tagRepo,
        AuthorRepository $authorRepo,
        string $googleId,
        EntityManagerInterface $entityManager,
        HttpClientInterface $httpClient
    ): Response {
        $book = $bookRepo->findOneByGoogleId($googleId);
        if ($book) {
            return $this->redirectToRoute('app_book_show', ['id' => $book->getId()], Response::HTTP_SEE_OTHER);
        }

        $book = new Book();

        $response = $httpClient->request(
            'GET',
            'https://www.googleapis.com/books/v1/volumes/'."$googleId"
        );

        $googleBook = $response->toArray();
        $volumeInfo = $response->toArray()['volumeInfo'];

        $book->setGoogleId($googleBook['id']);
        $book->setTitle($volumeInfo['title']);
        $book->setDescription($volumeInfo['description']);
        $book->setPageCount($volumeInfo['pageCount']);
        $book->setThumbnail($volumeInfo['imageLinks']['thumbnail']);
        $book->setAddedBy($this->getUser());
        $book->setAddedAt(new \DateTimeImmutable());
        foreach ($volumeInfo['authors'] as $author) {
            $newAuthor = $authorRepo->findOneByName($author);
            if (!$newAuthor) {
                $newAuthor = new Author();
                $newAuthor->setName($author);
                $entityManager->persist($newAuthor);
            }
            $book->addAuthor($newAuthor);
        }
        // test de persist sur Tag
        // $tag = $tagRepo->findOneByName('Policier');
        // $book->addTag($tag);

        // dd($book );
        $entityManager->persist($book);
        $entityManager->flush();

        return $this->redirectToRoute('app_book_show', ['id' => $book->getId()], Response::HTTP_SEE_OTHER);
    }

    #[Route('/{id}', name: 'app_book_show', methods: ['GET'])]
    public function show(Book $book, StatusRepository $statusRepo): Response
    {
        $status = $statusRepo->findAll();

        return $this->render('book/show.html.twig', [
            'book' => $book,
            'status' => $status,
        ]);
    }

    #[Route('/{id}/comments', name: 'app_book_comments', methods: ['GET'])]
    public function showComments(Book $book, StatusRepository $statusRepo): Response
    {
        $status = $statusRepo->findAll();

        return $this->render('book/comments.html.twig', [
            'book' => $book,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_book_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Book $book, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(BookType::class, $book);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $tags = $book->getKinds();
            // dd($tags);

            // $entityManager->persist($book);
            $entityManager->flush();

            return $this->redirectToRoute('app_book_show', ['id' => $book->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->render('book/edit.html.twig', [
            'book' => $book,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'app_book_delete', methods: ['POST'])]
    public function delete(Request $request, Book $book, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$book->getId(), $request->request->get('_token'))) {
            $entityManager->remove($book);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_book_index', [], Response::HTTP_SEE_OTHER);
    }
}
