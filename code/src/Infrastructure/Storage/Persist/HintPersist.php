<?php

namespace songguessr\Infrastructure\Storage\Persist;

use songguessr\Infrastructure\Storage\MySqlClient;

class HintPersist
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function clearHints(): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'DELETE FROM song_hint'
        );
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }
}