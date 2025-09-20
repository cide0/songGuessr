<?php

namespace songguessr;

use songguessr\Application\Handler\GetSongHandler;
use songguessr\Domain\Model\SongModel;
use songguessr\Domain\Service\SongService;
use songguessr\Infrastructure\Controller\SongGuessrController;
use songguessr\Infrastructure\Storage\MySqlClient;
use songguessr\Infrastructure\Storage\Read\SongStorage;

class Factory
{
    public function __construct(private Configuration $configuration)
    {
        session_start();
    }

    public function createSongGuessrController(): SongGuessrController
    {
        return new SongGuessrController(
            new GetSongHandler($this->createSongService())
        );
    }

    private function createSongService(): SongService
    {
        return new SongService(
            $this->createSongStorage()
        );
    }

    private function createMySqlClient(): MySqlClient
    {
        return new MySqlClient(
            $this->configuration->getHost(),
            $this->configuration->getUsername(),
            $this->configuration->getPassword(),
            $this->configuration->getDatabase()
        );
    }

    private function createSongStorage(): SongStorage
    {
        return new SongStorage(
            $this->createMySqlClient()
        );
    }
}