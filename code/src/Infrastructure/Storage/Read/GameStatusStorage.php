<?php

namespace songguessr\Infrastructure\Storage\Read;

use PDO;
use songguessr\Domain\Exception\SongGuessrException;
use songguessr\Infrastructure\Storage\MySqlClient;

class GameStatusStorage
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function getCurrentSongId(): int
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->query(
            'SELECT current_song_id FROM game_status
                    WHERE game_running = 1'
        );
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        $this->mySqlClient->closeConnection();

        if(empty($result)) {
            throw new SongGuessrException('No current song found, game is not running!', 404);
        }

        return $result['current_song_id'];
    }

}