<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\EventSubscriber;

use App\Entity\Invitation;
use App\Service\SendMailService;
use EasyCorp\Bundle\EasyAdminBundle\Event\AfterEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Uid\Uuid;

class EasyAdminSubscriber extends AbstractController implements EventSubscriberInterface
{
    public function __construct(private SendMailService $mailer)
    {
    }

    public static function getSubscribedEvents()
    {
        return [
            BeforeEntityPersistedEvent::class => ['setUuid'],
            AfterEntityPersistedEvent::class => ['sendEmailInvitation'],
        ];
    }

    public function setUuid(BeforeEntityPersistedEvent $event)
    {
        $entity = $event->getEntityInstance();

        if ($entity instanceof Invitation) {
            $entity->setUuid(Uuid::v4());
        }
    }

    public function sendEmailInvitation(AfterEntityPersistedEvent $event)
    {
        $entity = $event->getEntityInstance();

        if ($entity instanceof Invitation) {
            // envoi email

            // generation du lien de reinit
            $url = $this->generateUrl(
                'app_register',
                ['uuid' => $entity->getUuid()],
                UrlGeneratorInterface::ABSOLUTE_URL
            );

            $context = [
                'url' => $url,
                'user' => $entity,
            ];

            $this->mailer->send(
                'dontreply@ledos-dev.com',
                $entity->getEmail(),
                'Invitation à rejoindre ShareBouc !!',
                'invitation',
                $context
            );
        }
    }
}
