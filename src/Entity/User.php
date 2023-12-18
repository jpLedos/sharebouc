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

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table(name: '`user`')]
#[UniqueEntity(fields: ['email'], message: 'Un compte existe déja avec cet email !!!')]
#[UniqueEntity(fields: ['pseudo'], message: 'Ce pseudo est déja utilisé !!!')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[Groups(['book:read'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 180, unique: true)]
    #[Assert\Email]
    private ?string $email = null;

    #[ORM\Column]
    private array $roles = [];

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    private ?string $password = null;

    #[Groups(['book:read'])]
    #[ORM\Column(length: 255)]
    #[Assert\Length(
        min: 3,
        max: 25,
        minMessage: 'Votre pseudo doit avoir  {{ limit }} characteres minimum',
        maxMessage: 'Votre pseudo doit avoir  {{ limit }} characteres maximum',
    )]
    private ?string $pseudo = null;

    #[ORM\OneToMany(mappedBy: 'user', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $userBooks;

    #[ORM\OneToMany(mappedBy: 'AddedBy', targetEntity: Book::class)]
    private Collection $books;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $resetToken = null;

    public function __construct()
    {
        $this->userBooks = new ArrayCollection();
        $this->books = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->pseudo;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getPseudo(): ?string
    {
        return $this->pseudo;
    }

    public function setPseudo(string $pseudo): static
    {
        $this->pseudo = $pseudo;

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
            $userBook->setUser($this);
        }

        return $this;
    }

    public function removeUserBook(UserBook $userBook): static
    {
        if ($this->userBooks->removeElement($userBook)) {
            // set the owning side to null (unless already changed)
            if ($userBook->getUser() === $this) {
                $userBook->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Book>
     */
    public function getBooks(): Collection
    {
        return $this->books;
    }

    public function addBook(Book $book): static
    {
        if (!$this->books->contains($book)) {
            $this->books->add($book);
            $book->setAddedBy($this);
        }

        return $this;
    }

    public function removeBook(Book $book): static
    {
        if ($this->books->removeElement($book)) {
            // set the owning side to null (unless already changed)
            if ($book->getAddedBy() === $this) {
                $book->setAddedBy(null);
            }
        }

        return $this;
    }

    public function getResetToken(): ?string
    {
        return $this->resetToken;
    }

    public function setResetToken(?string $resetToken): static
    {
        $this->resetToken = $resetToken;

        return $this;
    }
}
