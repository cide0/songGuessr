<?php

namespace songguessr\Infrastructure\Storage\Persist;

use songguessr\Infrastructure\Storage\MySqlClient;

class GameStatusPersist
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function persistGameStatus(int $songId)
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'INSERT INTO game_status (game_running, current_song_id, started)
                    VALUES (1, :songId, NOW())'
        );
        $statement->bindValue('songId', $songId);
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }

    public function updateCurrentSong(int $songId): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'UPDATE game_status SET current_song_id = :songId'
        );
        $statement->bindValue('songId', $songId);
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }

    public function clearGameStatus(): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'DELETE FROM game_status'
        );
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }
}