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

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Repository\InvitationRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;

class RegistrationController extends AbstractController
{
    #[Route('/register/{uuid}', name: 'app_register')]
    public function register(
        string $uuid,
        InvitationRepository $invitationRepo,
        Request $request,
        UserPasswordHasherInterface $userPasswordHasher,
        EntityManagerInterface $entityManager,
        RequestStack $requestStack
    ): Response {
        $user = new User();
        $form0 = $this->createForm(RegistrationFormType::class, $user);
        $form0->handleRequest($request);
        // token valide dans la BDD ?
        $invitation = $invitationRepo->findOneByUuid($uuid);
        if (!$invitation) {
            // $this->addFlash('danger','une erreur est survenue, lien non valide');
            // return $this->redirectToRoute('app_login');
            return $this->render('registration/register.html.twig', [
                'registrationForm' => $form0->createView(),
                'linkAvalaible' => false,
            ]);
        }

        $user->setEmail($invitation->getEmail());
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $invitation->setReader($user);
            $invitation->setUuid('');
            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email
            // log du user

            $token = new UsernamePasswordToken($user, 'main', $user->getRoles());
            $this->container->get('security.token_storage')->setToken($token);
            $requestStack->getSession()->set('_security_main', serialize($token));

            return $this->redirectToRoute('app_book_index');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
            'linkAvalaible' => true,
        ]);
    }
}
