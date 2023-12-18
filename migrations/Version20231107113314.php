<?php

declare(strict_types=1);

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231107113314 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'add user(addedBy) in Table Book';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE book ADD added_by_id INT NOT NULL, ADD added_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\'');
        $this->addSql('ALTER TABLE book ADD CONSTRAINT FK_CBE5A33155B127A4 FOREIGN KEY (added_by_id) REFERENCES `user` (id)');
        $this->addSql('CREATE INDEX IDX_CBE5A33155B127A4 ON book (added_by_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE book DROP FOREIGN KEY FK_CBE5A33155B127A4');
        $this->addSql('DROP INDEX IDX_CBE5A33155B127A4 ON book');
        $this->addSql('ALTER TABLE book DROP added_by_id, DROP added_at');
    }
}
