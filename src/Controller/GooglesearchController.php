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

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GooglesearchController extends AbstractController
{
    #[Route('/googlesearch', name: 'app_googlesearch')]
    public function search(): Response
    {
        return $this->render('googlesearch/index.html.twig', [
            'controller_name' => 'GooglesearchController',
        ]);
    }
}
