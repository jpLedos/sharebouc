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
final class Version20231113101806 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_book DROP FOREIGN KEY FK_B164EFF87162BA4C');
        $this->addSql('DROP INDEX UNIQ_B164EFF87162BA4C ON user_book');
        $this->addSql('ALTER TABLE user_book DROP status2_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_book ADD status2_id INT NOT NULL');
        $this->addSql('ALTER TABLE user_book ADD CONSTRAINT FK_B164EFF87162BA4C FOREIGN KEY (status2_id) REFERENCES status (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_B164EFF87162BA4C ON user_book (status2_id)');
    }
}
