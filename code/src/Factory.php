<?php

namespace songguessr;

use songguessr\Application\Handler\GameStatusHandler;
use songguessr\Application\Handler\GetHintHandler;
use songguessr\Application\Handler\SongHandler;
use songguessr\Domain\Service\GameStatusService;
use songguessr\Domain\Service\HintService;
use songguessr\Domain\Service\SongService;
use songguessr\Infrastructure\Controller\SongGuessrController;
use songguessr\Infrastructure\Storage\MySqlClient;
use songguessr\Infrastructure\Storage\Persist\GameStatusPersist;
use songguessr\Infrastructure\Storage\Persist\PickerPersist;
use songguessr\Infrastructure\Storage\Persist\SongPersist;
use songguessr\Infrastructure\Storage\Read\GameStatusStorage;
use songguessr\Infrastructure\Storage\Read\HintStorage;
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
            new SongHandler($this->createSongService()),
            new GetHintHandler($this->createHintService()),
            new GameStatusHandler($this->createGameStatusService())
        );
    }

    private function createSongService(): SongService
    {
        return new SongService(
            $this->createSongStorage(),
            $this->createPickerPersist(),
            $this->createSongPersist()
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

    private function createHintService(): HintService
    {
        return new HintService(
            $this->createHintStorage()
        );
    }

    private function createHintStorage(): HintStorage
    {
        return new HintStorage(
            $this->createMySqlClient()
        );
    }

    private function createGameStatusService(): GameStatusService
    {
        return new GameStatusService(
            $this->createGameStatusPersist(),
            $this->createGameStatusStorage()
        );
    }

    private function createGameStatusPersist(): GameStatusPersist
    {
        return new GameStatusPersist(
            $this->createMySqlClient()
        );
    }

    private function createGameStatusStorage(): GameStatusStorage
    {
        return new GameStatusStorage(
            $this->createMySqlClient()
        );
    }

    private function createPickerPersist(): PickerPersist
    {
        return new PickerPersist(
            $this->createMySqlClient()
        );
    }

    private function createSongPersist(): SongPersist
    {
        return new SongPersist(
            $this->createMySqlClient()
        );
    }
}