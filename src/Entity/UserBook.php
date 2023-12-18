<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Entity;

use App\Repository\UserBookRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: UserBookRepository::class)]
class UserBook
{
    #[Groups(['book:read', 'userbook:read'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createAt = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $updatedAt = null;

    #[Groups(['book:read', 'userbook:read'])]
    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $comment = null;

    #[Groups(['book:read', 'userbook:read'])]
    #[ORM\Column(nullable: true)]
    private ?int $note = null;

    #[Groups(['book:read', 'userbook:read'])]
    #[ORM\ManyToOne(inversedBy: 'userBooks')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Status $status = null;

    #[Groups(['book:read'])]
    #[ORM\ManyToOne(inversedBy: 'userBooks')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    #[ORM\ManyToOne(inversedBy: 'userBooks')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Book $book = null;

    #[Groups(['book:read', 'userbook:read'])]
    #[ORM\Column(length: 255, nullable: true)]
    private ?string $commentTitle = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCreateAt(): ?\DateTimeImmutable
    {
        return $this->createAt;
    }

    public function setCreateAt(\DateTimeImmutable $createAt): static
    {
        $this->createAt = $createAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updatedAt): static
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getComment(): ?string
    {
        return $this->comment;
    }

    public function setComment(?string $comment): static
    {
        $this->comment = $comment;

        return $this;
    }

    public function getNote(): ?int
    {
        return $this->note;
    }

    public function setNote(?int $note): static
    {
        $this->note = $note;

        return $this;
    }

    public function getStatus(): ?status
    {
        return $this->status;
    }

    public function setStatus(?status $status): static
    {
        $this->status = $status;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    public function getBook(): ?Book
    {
        return $this->book;
    }

    public function setBook(?Book $book): static
    {
        $this->book = $book;

        return $this;
    }

    public function getCommentTitle(): ?string
    {
        return $this->commentTitle;
    }

    public function setCommentTitle(?string $commentTitle): static
    {
        $this->commentTitle = $commentTitle;

        return $this;
    }
}
