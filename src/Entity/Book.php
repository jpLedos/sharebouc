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

use App\Repository\BookRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Serializer\Annotation\Groups;

#[UniqueEntity(fields: ['googleId'], message: 'ce livre existe deja dans la bibliotheque !!!')]
#[ORM\Entity(repositoryClass: BookRepository::class)]
class Book
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['book:read'])]
    private ?int $id = null;

    #[Groups(['book:read'])]
    #[ORM\Column(length: 255)]
    private ?string $googleId = null;

    #[Groups(['book:read'])]
    #[ORM\Column(length: 255)]
    private ?string $title = null;

    #[Groups(['book:read'])]
    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[Groups(['book:read'])]
    #[ORM\Column(nullable: true)]
    private ?int $pageCount = null;

    #[Groups(['book:read'])]
    #[ORM\Column(type: Types::TEXT)]
    private ?string $thumbnail = null;

    #[Groups(['book:read'])]
    #[ORM\ManyToMany(targetEntity: Author::class, mappedBy: 'books')]
    private Collection $authors;

    #[Groups(['book:read'])]
    #[ORM\OneToMany(mappedBy: 'book', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $userBooks;

    #[Groups(['book:read'])]
    #[ORM\Column]
    private ?\DateTimeImmutable $AddedAt = null;

    #[Groups(['book:read'])]
    #[ORM\ManyToOne(inversedBy: 'books')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $AddedBy = null;

    #[Groups(['book:read'])]
    #[ORM\ManyToMany(targetEntity: Kind::class, inversedBy: 'books')]
    private Collection $kinds;

    public function __construct()
    {
        $this->authors = new ArrayCollection();
        $this->userBooks = new ArrayCollection();
        $this->kinds = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getGoogleId(): ?string
    {
        return $this->googleId;
    }

    public function setGoogleId(string $googleId): static
    {
        $this->googleId = $googleId;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getPageCount(): ?int
    {
        return $this->pageCount;
    }

    public function setPageCount(?int $pageCount): static
    {
        $this->pageCount = $pageCount;

        return $this;
    }

    public function getThumbnail(): ?string
    {
        return $this->thumbnail;
    }

    public function setThumbnail(string $thumbnail): static
    {
        $this->thumbnail = $thumbnail;

        return $this;
    }

    /**
     * @return Collection<int, Author>
     */
    public function getAuthors(): Collection
    {
        return $this->authors;
    }

    public function addAuthor(Author $author): static
    {
        if (!$this->authors->contains($author)) {
            $this->authors->add($author);
            $author->addBook($this);
        }

        return $this;
    }

    public function removeAuthor(Author $author): static
    {
        if ($this->authors->removeElement($author)) {
            $author->removeBook($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, UserBook>
     */
    public function getUserBooks(): Collection
    {
        return $this->userBooks;
    }

    public function addUserBook(UserBook $userBook): static
    {
        if (!$this->userBooks->contains($userBook)) {
            $this->userBooks->add($userBook);
            $userBook->setBook($this);
        }

        return $this;
    }

    public function removeUserBook(UserBook $userBook): static
    {
        if ($this->userBooks->removeElement($userBook)) {
            // set the owning side to null (unless already changed)
            if ($userBook->getBook() === $this) {
                $userBook->setBook(null);
            }
        }

        return $this;
    }

    public function getAddedAt(): ?\DateTimeImmutable
    {
        return $this->AddedAt;
    }

    public function setAddedAt(\DateTimeImmutable $AddedAt): static
    {
        $this->AddedAt = $AddedAt;

        return $this;
    }

    public function getAddedBy(): ?User
    {
        return $this->AddedBy;
    }

    public function setAddedBy(?User $AddedBy): static
    {
        $this->AddedBy = $AddedBy;

        return $this;
    }

    /**
     * @return Collection<int, Kind>
     */
    public function getKinds(): Collection
    {
        return $this->kinds;
    }

    public function addKind(Kind $kind): static
    {
        if (!$this->kinds->contains($kind)) {
            $this->kinds->add($kind);
        }

        return $this;
    }

    public function removeKind(Kind $kind): static
    {
        $this->kinds->removeElement($kind);

        return $this;
    }
}
