<?php

namespace songguessr\Application\Handler;

use songguessr\Domain\Model\SongModel;
use songguessr\Domain\Service\SongService;

class GetSongHandler
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
}