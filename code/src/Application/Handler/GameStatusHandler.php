<?php

namespace songguessr\Application\Handler;

use songguessr\Domain\Service\GameStatusService;

class GameStatusHandler
{
    public function __construct(
        private GameStatusService $gameStatusService
    )
    {
    }

    public function handleStartNewGame(int $songId): void
    {
        $this->gameStatusService->startNewGame($songId);
    }

    public function handleGetCurrentSongId(): int
    {
        return $this->gameStatusService->getCurrentSongId();
    }

    public function handleUpdateCurrentSong(int $songId): void
    {
        $this->gameStatusService->updateCurrentSong($songId);
    }

    public function handleClearGameStatus(): void
    {
        $this->gameStatusService->clearGameStatus();
    }
}