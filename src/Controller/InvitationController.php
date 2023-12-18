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

use App\Entity\Invitation;
use App\Form\InvitationType;
use App\Service\SendMailService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Uid\Uuid;

class InvitationController extends AbstractController
{
    #[Route('/invitation', name: 'app_invitation', methods: ['GET', 'POST'])]
    public function invitation(
        SendMailService $mailer,
        Request $request,
        EntityManagerInterface $entityManager,
    ): Response {
        $invitation = new Invitation();
        $form = $this->createForm(InvitationType::class, $invitation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password

            $email = $form->get('email')->getData();
            $invitation->setEmail($email);
            $invitation->setUuid(Uuid::v4());
            $entityManager->persist($invitation);
            $entityManager->flush();

            // envoi email

            // generation du lien de reinit
            $url = $this->generateUrl(
                'app_register',
                ['uuid' => $invitation->getUuid()],
                UrlGeneratorInterface::ABSOLUTE_URL
            );

            $context = [
                'url' => $url,
                'user' => $this->getUser(),
            ];

            $mailer->send(
                'dontreply@ledos-dev.com',
                $invitation->getEmail(),
                'Invitation à rejoindre ShareBouc !!',
                'invitation',
                $context
            );

            $this->addFlash('success', 'Votre invitation a bien été envoyée à '.$invitation->getEmail().'!!!');

            return $this->redirectToRoute('app_book_index');
        }

        return $this->render('invitation/invitation.html.twig', [
                'invitationForm' => $form->createView(),
            ]);
    }
}
