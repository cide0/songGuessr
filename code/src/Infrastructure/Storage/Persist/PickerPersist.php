<?php

namespace songguessr\Infrastructure\Storage\Persist;

use songguessr\Domain\Model\PickerModel;
use songguessr\Infrastructure\Storage\MySqlClient;

class PickerPersist
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function persistPicker(PickerModel $pickerModel): int
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'INSERT INTO picker (first_name, last_name)
                    VALUES (:firstName, :lastName)'
        );
        $statement->bindValue('firstName', $pickerModel->getFirstName());
        $statement->bindValue('lastName', $pickerModel->getLastName());
        $statement->execute();
        $pickerId = $connection->lastInsertId();
        $this->mySqlClient->closeConnection();

        return (int) $pickerId;
    }
}