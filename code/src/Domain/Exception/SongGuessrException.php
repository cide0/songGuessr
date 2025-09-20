<?php

namespace songguessr\Domain\Exception;

use Exception;

class SongGuessrException extends Exception
{

    public function __construct(
        private string $userMessage,
        private int $statusCode,
        private string $internalMessage = '',
        protected $code = 0
    ) {
        if (!$internalMessage) {
            $internalMessage = $userMessage;
        }
        parent::__construct($internalMessage, $this->code);
    }

    public function getUserMessage(): string
    {
        return $this->userMessage;
    }

    public function getStatusCode(): int
    {
        return $this->statusCode;
    }

    public function getInternalMessage(): int
    {
        return $this->internalMessage;
    }
}