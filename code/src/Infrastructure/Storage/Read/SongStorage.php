<?php

namespace songguessr\Infrastructure\Storage\Read;

use songguessr\Domain\Exception\SongGuessrException;
use songguessr\Domain\Model\SongModel;
use songguessr\Infrastructure\Storage\MySqlClient;

class SongStorage
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function loadRandomSong(): SongModel
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->query(
            'SELECT * FROM song
                    INNER JOIN picker ON song.picked_by = picker.id
                    WHERE guessed = 0 
                    ORDER BY RAND() LIMIT 1'
        );
        $statement->execute();
        $result = $statement->fetchAll();
        $this->mySqlClient->closeConnection();

        if(empty($result[0])) {
            throw new SongGuessrException('No more unplayed songs available!', 404);
        }

        return new SongModel($result[0]);
    }
}