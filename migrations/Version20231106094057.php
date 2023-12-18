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
final class Version20231106094057 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'cration des tables et des relations';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE author (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE author_book (author_id INT NOT NULL, book_id INT NOT NULL, INDEX IDX_2F0A2BEEF675F31B (author_id), INDEX IDX_2F0A2BEE16A2B381 (book_id), PRIMARY KEY(author_id, book_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE book (id INT AUTO_INCREMENT NOT NULL, google_id VARCHAR(255) NOT NULL, title VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, page_count INT DEFAULT NULL, thumbnail VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE status (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tag (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tag_book (tag_id INT NOT NULL, book_id INT NOT NULL, INDEX IDX_25EA1C87BAD26311 (tag_id), INDEX IDX_25EA1C8716A2B381 (book_id), PRIMARY KEY(tag_id, book_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_book (id INT AUTO_INCREMENT NOT NULL, status_id INT NOT NULL, user_id INT NOT NULL, book_id INT NOT NULL, create_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', comment LONGTEXT DEFAULT NULL, note INT DEFAULT NULL, INDEX IDX_B164EFF86BF700BD (status_id), INDEX IDX_B164EFF8A76ED395 (user_id), INDEX IDX_B164EFF816A2B381 (book_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE author_book ADD CONSTRAINT FK_2F0A2BEEF675F31B FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE author_book ADD CONSTRAINT FK_2F0A2BEE16A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tag_book ADD CONSTRAINT FK_25EA1C87BAD26311 FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tag_book ADD CONSTRAINT FK_25EA1C8716A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_book ADD CONSTRAINT FK_B164EFF86BF700BD FOREIGN KEY (status_id) REFERENCES status (id)');
        $this->addSql('ALTER TABLE user_book ADD CONSTRAINT FK_B164EFF8A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE user_book ADD CONSTRAINT FK_B164EFF816A2B381 FOREIGN KEY (book_id) REFERENCES book (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE author_book DROP FOREIGN KEY FK_2F0A2BEEF675F31B');
        $this->addSql('ALTER TABLE author_book DROP FOREIGN KEY FK_2F0A2BEE16A2B381');
        $this->addSql('ALTER TABLE tag_book DROP FOREIGN KEY FK_25EA1C87BAD26311');
        $this->addSql('ALTER TABLE tag_book DROP FOREIGN KEY FK_25EA1C8716A2B381');
        $this->addSql('ALTER TABLE user_book DROP FOREIGN KEY FK_B164EFF86BF700BD');
        $this->addSql('ALTER TABLE user_book DROP FOREIGN KEY FK_B164EFF8A76ED395');
        $this->addSql('ALTER TABLE user_book DROP FOREIGN KEY FK_B164EFF816A2B381');
        $this->addSql('DROP TABLE author');
        $this->addSql('DROP TABLE author_book');
        $this->addSql('DROP TABLE book');
        $this->addSql('DROP TABLE status');
        $this->addSql('DROP TABLE tag');
        $this->addSql('DROP TABLE tag_book');
        $this->addSql('DROP TABLE user_book');
    }
}
