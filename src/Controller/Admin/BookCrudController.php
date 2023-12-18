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

use App\Entity\Book;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class BookCrudController extends AbstractCrudController
{
    use Trait\NoDeleteTrait;

    public static function getEntityFqcn(): string
    {
        return Book::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            // IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description')->hideOnIndex(),
            ImageField::new('thumbnail')->setUploadDir('images\thumbnails')->hideOnForm(),
            TextField::new('thumbnail')->onlyOnForms(),
            AssociationField::new('authors', 'Auteurs')->autocomplete()->onlyOnForms(),
            AssociationField::new('kinds', 'Genres')->autocomplete()->onlyOnForms(),
            CollectionField::new('authors', 'Auteurs')->hideOnForm(),
            CollectionField::new('kinds', 'Genres')->hideOnForm(),
        ];
    }
}
