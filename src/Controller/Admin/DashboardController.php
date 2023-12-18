<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Controller\Admin;

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\Invitation;
use App\Entity\Kind;
use App\Entity\Status;
use App\Entity\User;
use App\Entity\UserBook;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        // return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);

        return $this->redirect($adminUrlGenerator->setController(BookCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('ShareBook');
    }

    public function configureMenuItems(): iterable
    {
        // yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Livres', 'fas fa-book', Book::class);
        yield MenuItem::linkToCrud('Auteurs', 'fas fa-user-pen', Author::class);
        yield MenuItem::linkToCrud('Status', 'fas fa-info-circle', Status::class);
        yield MenuItem::linkToCrud('Tag', 'fas fa-tag', Kind::class);
        yield MenuItem::linkToCrud('Utilisateur', 'fas fa-user', User::class);
        yield MenuItem::linkToCrud('Liste de lecture', 'fas fa-book-reader', UserBook::class);
        yield MenuItem::linkToCrud('Invitation', 'fas fa-envelope', Invitation::class);
        yield MenuItem::linktoRoute('Retour vers le site', 'fas fa-globe', 'app_home');
    }
}
