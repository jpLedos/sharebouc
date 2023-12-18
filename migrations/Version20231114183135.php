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
final class Version20231114183135 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE book_kind (book_id INT NOT NULL, kind_id INT NOT NULL, INDEX IDX_2259F7D116A2B381 (book_id), INDEX IDX_2259F7D130602CA9 (kind_id), PRIMARY KEY(book_id, kind_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE kind (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE book_kind ADD CONSTRAINT FK_2259F7D116A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE book_kind ADD CONSTRAINT FK_2259F7D130602CA9 FOREIGN KEY (kind_id) REFERENCES kind (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE book_kind DROP FOREIGN KEY FK_2259F7D116A2B381');
        $this->addSql('ALTER TABLE book_kind DROP FOREIGN KEY FK_2259F7D130602CA9');
        $this->addSql('DROP TABLE book_kind');
        $this->addSql('DROP TABLE kind');
    }
}
