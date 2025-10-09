<?php

namespace songguessr\Infrastructure\Storage\Read;

use PDO;
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
                    INNER JOIN picker ON song.picked_by = picker.picker_id
                    WHERE guessed = 0 
                    ORDER BY RAND() LIMIT 1'
        );
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        $this->mySqlClient->closeConnection();

        if(empty($result)) {
            throw new SongGuessrException('No more unplayed songs available!', 404);
        }

        return new SongModel($result);
    }

    public function loadSongById(int $songId)
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'SELECT * FROM song
                    INNER JOIN picker ON song.picked_by = picker.picker_id
                    WHERE song_id = :songId'
        );
        $statement->bindValue('songId', $songId);
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        $this->mySqlClient->closeConnection();

        if(empty($result)) {
            throw new SongGuessrException('No more unplayed songs available!', 404);
        }

        return new SongModel($result);
    }
}