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
final class Version20231121085731 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE tag (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, bg_color VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tag_book (tag_id INT NOT NULL, book_id INT NOT NULL, INDEX IDX_25EA1C87BAD26311 (tag_id), INDEX IDX_25EA1C8716A2B381 (book_id), PRIMARY KEY(tag_id, book_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE tag_book ADD CONSTRAINT FK_25EA1C87BAD26311 FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tag_book ADD CONSTRAINT FK_25EA1C8716A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_book ADD comment_title VARCHAR(255) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE tag_book DROP FOREIGN KEY FK_25EA1C87BAD26311');
        $this->addSql('ALTER TABLE tag_book DROP FOREIGN KEY FK_25EA1C8716A2B381');
        $this->addSql('DROP TABLE tag');
        $this->addSql('DROP TABLE tag_book');
        $this->addSql('ALTER TABLE user_book DROP comment_title');
    }
}
