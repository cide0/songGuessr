<?php

namespace songguessr\Application\Handler;

use songguessr\Domain\Model\SongModel;
use songguessr\Domain\Service\SongService;

class SongHandler
{
    public function __construct(
        private SongService $songService
    )
    {
    }

    public function handleGetRandomSong(): SongModel
    {
        return $this->songService->getRandomSong();
    }

    public function handleGetSongById(int $songId): SongModel
    {
        return $this->songService->getSongById($songId);
    }

    public function handleAddSong(array $formData): void
    {
        $this->songService->addSong($formData);
    }

    public function handleSetSongAsGuessed(int $songId): void
    {
        $this->songService->setSongAsGuessed($songId);
    }

    public function handleResetSongs(): void
    {
        $this->songService->resetSongs();
    }
}