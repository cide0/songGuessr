<?php

namespace songguessr\Application\Handler;

use songguessr\Domain\Model\HintModel;
use songguessr\Domain\Service\HintService;

class GetHintHandler
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
}