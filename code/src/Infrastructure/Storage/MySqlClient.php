<?php

namespace songguessr\Infrastructure\Storage;

use PDO;

class MySqlClient
{
    private ?PDO $connection = null;

    public function __construct(
        private string $host,
        private string $username,
        private string $password,
        private string $database
    ) {}

    public function connect(): PDO
    {
        if (!$this->connection) {
            $this->connection = new PDO("mysql:host=$this->host;dbname=$this->database", $this->username, $this->password);
        }
        return $this->connection;
    }

    public function closeConnection(): void
    {
        $this->connection = null;
    }
}