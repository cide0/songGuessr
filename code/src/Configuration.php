<?php

namespace songguessr;

class Configuration
{
    private static array $defaults = [
        'DB_HOST' => 'mysql',
        'DB_USERNAME' => 'root',
        'MYSQL_ROOT_PASSWORD' => 'admin',
        'DB_NAME' => 'songguessr',
        'TEST_DB_NAME' => 'songguessr_testing',
        'USE_TEST_DB' => 'false',
    ];

    private function loadEnvFile(string $path): void
    {
        if (!is_file($path)) {
            return;
        }
        $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        if ($lines === false) {
            return;
        }
        foreach ($lines as $line) {
            $line = trim($line);
            if ($line === '' || str_starts_with($line, '#')) {
                continue;
            }
            $pos = strpos($line, '=');
            if ($pos === false) {
                continue;
            }
            $name = trim(substr($line, 0, $pos));
            $value = substr($line, $pos + 1);
            if ((str_starts_with($value, '"') && str_ends_with($value, '"')) || (str_starts_with($value, "'") && str_ends_with($value, "'"))) {
                $value = substr($value, 1, -1);
            }
            if (!array_key_exists($name, $_ENV) || $_ENV[$name] === '') {
                $_ENV[$name] = $value;
                putenv(sprintf('%s=%s', $name, $value));
            }
        }
    }

    public function __construct()
    {
        $this->loadEnvFile(__DIR__ . '/../../.env');
    }

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
        return $useTestDb ? getenv('TEST_DB_NAME') : getenv('DB_NAME');
    }
}