<?php

namespace songguessr\Application\Handler;

use songguessr\Domain\Model\HintModel;
use songguessr\Domain\Service\HintService;

class HintHandler
{
    public function __construct(
        private HintService $hintService
    )
    {
    }

    public function handleGetSongHintBySequenceNumber(int $songId, int $sequenceNumber): HintModel
    {
        return $this->hintService->getSongHintBySequenceNumber($songId, $sequenceNumber);
    }

    public function handleRerollHints(): void
    {
        $this->hintService->clearHints();
        $this->hintService->generateHintsForAllSongs();
    }
}