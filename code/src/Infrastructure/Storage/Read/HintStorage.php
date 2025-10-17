<?php

namespace songguessr\Infrastructure\Storage\Read;

use PDO;
use songguessr\Domain\Exception\SongGuessrException;
use songguessr\Domain\Model\HintModel;
use songguessr\Domain\Model\HintTypeMapModel;
use songguessr\Infrastructure\Storage\MySqlClient;

class HintStorage
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function loadSongHintBySequenceNumber(int $songId, int $sequenceNumber): HintModel
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'SELECT * FROM song_hint
                    INNER JOIN hint ON song_hint.hint_id = hint.hint_id
                    WHERE sequence = :sequenceNumber 
                    AND song_id = :songId'
        );
        $statement->bindValue('sequenceNumber', $sequenceNumber);
        $statement->bindValue('songId', $songId);
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        $this->mySqlClient->closeConnection();

        if(empty($result)) {
            throw new SongGuessrException(
                "No hint with sequence number $sequenceNumber for song with id $songId found!",
                404
            );
        }

        return new HintModel($result);
    }

    public function loadHintTypeMap(int $audioHintId): HintTypeMapModel
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'SELECT * FROM hint WHERE hint_id != :audioHintId' // Audio hint is default and not needed in the map
        );
        $statement->bindValue('audioHintId', $audioHintId);
        $statement->execute();
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        $this->mySqlClient->closeConnection();

        if(empty($result)) {
            throw new SongGuessrException(
                "No hints found!",
                404
            );
        }

        return new HintTypeMapModel($result);
    }
}