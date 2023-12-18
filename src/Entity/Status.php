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

use App\Repository\StatusRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: StatusRepository::class)]
class Status
{
    #[Groups(['userbook:read'])]
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Groups(['userbook:read'])]
    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\OneToMany(mappedBy: 'status', targetEntity: UserBook::class)]
    private Collection $userBooks;

    public function __construct()
    {
        $this->userBooks = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->name;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

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
            $userBook->setStatus($this);
        }

        return $this;
    }

    public function removeUserBook(UserBook $userBook): static
    {
        if ($this->userBooks->removeElement($userBook)) {
            // set the owning side to null (unless already changed)
            if ($userBook->getStatus() === $this) {
                $userBook->setStatus(null);
            }
        }

        return $this;
    }

    public function getUserBook(): ?UserBook
    {
        return $this->userBook;
    }

    public function setUserBook(UserBook $userBook): static
    {
        // set the owning side of the relation if necessary
        if ($userBook->getStatus() !== $this) {
            $userBook->setStatus($this);
        }

        $this->userBook = $userBook;

        return $this;
    }
}
