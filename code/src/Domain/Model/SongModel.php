<?php

namespace songguessr\Domain\Model;

class SongModel
{
    private int $id;
    private string $name;
    private string $artist;
    private bool $guessed;
    private PickerModel $picker;
    private ?string $audioSource;
    private ?string $videoSource;
    private ?string $album;
    private ?string $albumCoverSource;

    public function __construct(array $data) {
        $this->id = $data['song_id'];
        $this->name = $data['name'];
        $this->artist = $data['artist'];
        $this->guessed = (bool) $data['guessed'];
        $this->picker = PickerModel::fromSongData($data);
        $this->audioSource = $this->extractAudioSource($data);
        $this->videoSource = $this->extractVideoSource($data);
        $this->album = $this->extractAlbum($data);
        $this->albumCoverSource = $this->extractAlbumCoverSource($data);
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

    public function getAudioSource(): ?string
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

    private function extractAudioSource(array $data): ?string
    {
        if(isset($data['audio_source'])) {
            return $data['audio_Source'];
        }

        return null;
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
}