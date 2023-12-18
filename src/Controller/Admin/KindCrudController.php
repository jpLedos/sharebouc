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

use App\Entity\Kind;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ColorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class KindCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Kind::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            // IdField::new('id'),
            TextField::new('name'),
            ColorField::new('color')->showValue(),
            ColorField::new('bgColor')->showValue(),
        ];
    }
}
