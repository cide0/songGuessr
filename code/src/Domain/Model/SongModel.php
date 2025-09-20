<?php

namespace songguessr\Domain\Model;

class SongModel
{
    private int $id;
    private string $name;
    private string $artist;
    private bool $guessed;
    private PickerModel $picker;

    public function __construct(array $data) {
        $this->id = $data['id'];
        $this->name = $data['name'];
        $this->artist = $data['artist'];
        $this->guessed = (bool) $data['guessed'];
        $this->picker = PickerModel::fromSongData($data);
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getArtist(): string
    {
        return $this->artist;
    }

    public function isGuessed(): bool
    {
        return $this->guessed;
    }

    public function getPicker(): PickerModel
    {
        return $this->picker;
    }
}