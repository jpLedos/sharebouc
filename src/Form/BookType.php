<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Form;

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\Kind;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BookType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'label' => 'Titre',
            ])
            ->add('kinds', EntityType::class, [
                'class' => Kind::class,
                'label' => 'Genres',
                'autocomplete' => true,
                'multiple' => true,
            ])
            // ->add('authors', EntityType::class,[
            //     'class'=>Author::class,
            //     'label'=>'Auteurs',
            //     'autocomplete' => true,
            //     'multiple' => true
            // ])
            // ->add('thumbnail',TextType::class,[
            //     'label'=>'lien vers l\'image de couverture'
            // ])
            ->add('description', CKEditorType::class, [
                'label' => 'Résumé',
                ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Book::class,
        ]);
    }
}
