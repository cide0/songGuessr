<?php

namespace songguessr;

use DI\Container;
use songguessr\Infrastructure\Controller\SongGuessrController;

class Factory
{
    public function __construct(private Container $container)
    {
        session_start();
    }

    public function createSongGuessrController()
    {
        return new SongGuessrController();
    }
}