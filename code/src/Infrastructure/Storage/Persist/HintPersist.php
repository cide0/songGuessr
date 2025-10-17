<?php

namespace songguessr\Infrastructure\Storage\Persist;

use songguessr\Domain\Model\HintModel;
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

    /**
     * @param HintModel[] $hintModels
     */
    public function persistHints(array $hintModels): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'INSERT INTO song_hint (song_id, hint_id, sequence, content_replace_1) 
                    VALUES (:songId, :hintId, :sequence, :hintContent)'
        );

        foreach ($hintModels as $hintModel) {
            $statement->bindValue('songId', $hintModel->getSongId());
            $statement->bindValue('hintId', $hintModel->getId());
            $statement->bindValue('sequence', $hintModel->getSequence());
            $statement->bindValue('hintContent', $hintModel->getContentReplaceOne());
            $statement->execute();
        }

        $this->mySqlClient->closeConnection();
    }
}