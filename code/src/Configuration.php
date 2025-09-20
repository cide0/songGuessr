<?php

namespace songguessr;

class Configuration
{
    private CONST USE_TEST_DB = false;
    private CONST HOST = 'mysql';
    private CONST USERNAME = 'root';
    private CONST PASSWORD = 'admin';
    private CONST DATABASE = 'songguessr';
    private CONST TEST_DATABASE = 'songguessr_testing';

    public function getHost(): string
    {
        return self::HOST;
    }

    public function getUsername(): string
    {
        return self::USERNAME;
    }

    public function getPassword(): string
    {
        return self::PASSWORD;
    }

    public function getDatabase(): string
    {
        return self::USE_TEST_DB ? self::TEST_DATABASE : self::DATABASE;
    }
}