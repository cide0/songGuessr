<?php

namespace songguessr\Domain\Service;

use songguessr\Infrastructure\Storage\Persist\GameStatusPersist;
use songguessr\Infrastructure\Storage\Read\GameStatusStorage;

class GameStatusService
{
    public function __construct(
        private GameStatusPersist $gameStatusPersist,
        private GameStatusStorage $gameStatusStorage
    )
    {
    }

    public function startNewGame(int $songId): void
    {
        $this->gameStatusPersist->persistGameStatus($songId);
    }

    public function getCurrentSongId(): int
    {
        return $this->gameStatusStorage->getCurrentSongId();
    }

    public function updateCurrentSong(int $songId): void
    {
        $this->gameStatusPersist->updateCurrentSong($songId);
    }

    public function clearGameStatus()
    {
        $this->gameStatusPersist->clearGameStatus();
    }
}