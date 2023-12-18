<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Controller\Admin\Trait;

use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;

trait NoEditTrait
{
    public function configureActions(Actions $actions): Actions
    {
        $actions
           // ->disable(Action::NEW, Action::EDIT,Action::DELETE);
           ->disable(Action::EDIT);
        // ->disable(Action::NEW)
        // ->add(Crud::PAGE_INDEX,Action::DETAIL, Action::EDIT);

        return $actions;
    }
}
