<?php

namespace songguessr;

class Configuration
{
    public function getHost(): string
    {
        return getenv('DB_HOST');
    }

    public function getUsername(): string
    {
        return getenv('DB_USERNAME');
    }

    public function getPassword(): string
    {
        return getenv('MYSQL_ROOT_PASSWORD');
    }

    public function getDatabase(): string
    {
        $useTestDb = getenv('USE_TEST_DB');

        if(filter_var($useTestDb, FILTER_VALIDATE_BOOLEAN)) {
            return getenv('TEST_DB_NAME');
        }

        return getenv('DB_NAME');
    }
}