<?php

namespace songguessr\Domain\Model;

class SongModel
{
    private ?int $id;
    private string $name;
    private string $artist;
    private ?bool $guessed;
    private ?PickerModel $picker;
    private string $audioSource;
    private ?string $videoSource;
    private ?string $album;
    private ?string $albumCoverSource;
    private ?int $released;

    public function __construct(array $data) {
        $this->id = $this->extractSongId($data);
        $this->name = $data['name'];
        $this->artist = $data['artist'];
        $this->guessed = $this->extractGuessed($data);
        $this->picker = $this->extractPicker($data);
        $this->audioSource = $data['audio_source'];
        $this->videoSource = $this->extractVideoSource($data);
        $this->album = $this->extractAlbum($data);
        $this->albumCoverSource = $this->extractAlbumCoverSource($data);
        $this->released = $this->extractReleased($data);
    }

    public function getId(): ?int
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

    public function getPicker(): ?PickerModel
    {
        return $this->picker;
    }

    public function getAudioSource(): string
    {
        return $this->audioSource;
    }

    public function getVideoSource(): ?string
    {
        return $this->videoSource;
    }

    public function getAlbum(): ?string
    {
        return $this->album;
    }

    public function getAlbumCoverSource(): ?string
    {
        return $this->albumCoverSource;
    }

    public function getReleased(): ?int
    {
        return $this->released;
    }

    private function extractVideoSource(array $data): ?string
    {
        if(isset($data['video_source'])) {
            return $data['video_source'];
        }

        return null;
    }

    private function extractAlbum(array $data): ?string
    {
        if(isset($data['album'])) {
            return $data['album'];
        }

        return null;
    }

    private function extractAlbumCoverSource(array $data): ?string
    {
        if(isset($data['album_cover_source'])) {
            return $data['album_cover_source'];
        }

        return null;
    }

    private function extractReleased(array $data): ?int
    {
        if(isset($data['released'])) {
            return $data['released'];
        }

        return null;
    }

    private function extractSongId(array $data): ?int
    {
        if(isset($data['song_id'])) {
            return $data['song_id'];
        }

        return null;
    }

    private function extractGuessed(array $data): ?bool
    {
        if(isset($data['guessed'])) {
            return (bool) $data['guessed'];
        }

        return null;
    }

    private function extractPicker(array $data): ?PickerModel
    {
        if(isset($data['picked_by'])) {
            return PickerModel::fromSongData($data);
        }

        return null;
    }
}