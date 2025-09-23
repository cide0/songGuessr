<?php

namespace songguessr\Domain\Service;

use songguessr\Domain\Model\HintModel;
use songguessr\Infrastructure\Storage\Read\HintStorage;

class HintService
{
    public function __construct(
        private HintStorage $hintStorage
    )
    {
    }

    public function getSongHintBySequenceNumber(int $songId, int $sequenceNumber): HintModel
    {
        return $this->hintStorage->loadSongHintBySequenceNumber($songId, $sequenceNumber);
    }
}