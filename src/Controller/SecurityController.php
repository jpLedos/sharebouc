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

use App\Form\ResetPasswordRequestType;
use App\Form\ResetPasswordType;
use App\Repository\UserRepository;
use App\Service\SendMailService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Uid\Uuid;

class SecurityController extends AbstractController
{
    #[Route(path: '/login', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        if ($this->getUser()) {
            return $this->redirectToRoute('app_book_index');
        }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }

    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }

    #[Route(path: '/forgotten_password', name: 'app_forgotten_password')]
    public function forgotten_password(
        Request $request,
        UserRepository $userRepo,
        // TokenGeneratorInterface $tokenGenerator,
        EntityManagerInterface $em,
        SendMailService $mailer
    ): Response {
        $form = $this->createForm(ResetPasswordRequestType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // on va chercher si un user a bien cette email
            $user = $userRepo->findOneByEmail($form->get('email')->getData());
            // si on a un utilisateur
            if ($user) {
                // token generate
                $token = Uuid::v4();
                $user->setResetToken($token);
                $em->persist($user);
                $em->flush();

                // generation du lien de reinit
                $url = $this->generateUrl(
                    'app_reset_password',
                    ['token' => $token],
                    UrlGeneratorInterface::ABSOLUTE_URL
                );

                // envoi email
                $context = [
                        'url' => $url,
                        'user' => $user,
                ];

                $mailer->send(
                    'dontreply@ledos-dev.com',
                    $user->getEmail(),
                    'Reinitalisation de votre mot de passe',
                    'reset-password',
                    $context
                );

                $this->addFlash('success', 'le lien de reinitalisation vous a été envoyé par email');
            } else {
                $this->addFlash('warning', 'Désolé, un problème est survenu lors du traitement');
            }

            return $this->redirectToRoute('app_login');
        }

        return $this->render('security/reset_password_request.html.twig', [
            'ResetPasswordRequest' => $form->createView(),
        ]);
    }

    #[Route(path: '/reset_password/{token}', name: 'app_reset_password')]
    public function resetPassword(
        string $token,
        UserRepository $userRepo,
        Request $request,
        EntityManagerInterface $em,
        UserPasswordHasherInterface $hasher
    ): Response {
        // token valide dans la BDD ?
        $user = $userRepo->findOneByResetToken($token);

        if (!$user) {
            $this->addFlash('warning', 'une erreur est survenue ou lien non valide');

            return $this->redirectToRoute('app_login');
        }

        $form = $this->createForm(ResetPasswordType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // on efface le token
            $user->setResetToken('');
            $user->setPassword(
                $hasher->hashPassword(
                    $user,
                    $form->get('password')->getData()
                )
            );
            $em->persist($user);
            $em->flush();

            $this->addFlash('success', 'mot de passe reinitialisé');

            return $this->redirectToRoute('app_login');
        }

        return $this->render('security/reset_password.html.twig', [
            'ResetPassword' => $form->createView(),
        ]);
    }
}
