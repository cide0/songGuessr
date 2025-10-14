<?php

namespace songguessr\Domain\Model;

class PickerModel
{
    public function __construct(
        private ?int $id,
        private string $firstName,
        private string $lastName
    )
    {}

    public static function fromSongData(array $data): self
    {
        return new self(
            $data['picked_by'] ?? null,
            $data['first_name'],
            $data['last_name']
        );
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstName(): string
    {
        return $this->firstName;
    }

    public function getLastName(): string
    {
        return $this->lastName;
    }
}