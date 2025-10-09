<?php

namespace songguessr\Domain\Service;

use songguessr\Domain\Model\SongModel;
use songguessr\Infrastructure\Storage\Read\SongStorage;

class SongService
{
    public function __construct(
        private SongStorage $songStorage
    )
    {
    }

    public function getRandomSong(): SongModel
    {
        return $this->songStorage->loadRandomSong();
    }

    public function getSongById(int $songId): SongModel
    {
        return $this->songStorage->loadSongById($songId);
    }
}