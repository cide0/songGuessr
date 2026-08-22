<?php

namespace songguessr;

class Configuration
{
    private CONST USE_TEST_DB = false;
    private CONST DEFAULT_HOST = 'mysql';
    private CONST DEFAULT_USERNAME = 'root';
    private CONST DEFAULT_PASSWORD = 'admin';
    private CONST DEFAULT_DATABASE = 'songguessr';
    private CONST DEFAULT_TEST_DATABASE = 'songguessr_testing';

    public function getHost(): string
    {
        $value = getenv('DB_HOST');
        return $value !== false && $value !== '' ? $value : self::DEFAULT_HOST;
    }

    public function getUsername(): string
    {
        $value = getenv('DB_USERNAME');
        return $value !== false && $value !== '' ? $value : self::DEFAULT_USERNAME;
    }

    public function getPassword(): string
    {
        $value = getenv('MYSQL_ROOT_PASSWORD');
        return $value !== false && $value !== '' ? $value : self::DEFAULT_PASSWORD;
    }

    public function getDatabase(): string
    {
        $value = getenv('DB_NAME');
        if ($value !== false && $value !== '') {
            return $value;
        }
        return self::USE_TEST_DB ? self::DEFAULT_TEST_DATABASE : self::DEFAULT_DATABASE;
    }
}