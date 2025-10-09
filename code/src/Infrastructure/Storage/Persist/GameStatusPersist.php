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
}