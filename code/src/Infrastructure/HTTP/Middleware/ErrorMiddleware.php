<?php

namespace songguessr\Infrastructure\HTTP\Middleware;

use JsonException;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Interfaces\ErrorHandlerInterface;
use Slim\Psr7\Response;
use songguessr\Domain\Exception\SongGuessrException;
use Throwable;

class ErrorMiddleware implements ErrorHandlerInterface
{
    private const DEFAULT_STATUS_CODE = 500;
    private const DEFAULT_ERROR = 'Error occurred in songguessr api!';
    private const JSON_USER_ERROR = 'JSON could not be handled successfully!';
    private ?ResponseInterface $response = null;
    private Throwable|SongGuessrException $exception;

    #[\Override]
    public function __invoke(
        ?ServerRequestInterface $request,
        Throwable $exception,
        bool $displayErrorDetails,
        bool $logErrors,
        bool $logErrorDetails
    ): ResponseInterface {
        $this->response = new Response();
        $this->exception = $exception;

        return $this->respond();
    }

    private function respond(): ResponseInterface
    {
        $jsonErrorMessage = json_encode([
            'errors' => [
                [
                    'userMessage' => $this->getUserMessage(),
                    'internalMessage' => $this->exception->getMessage(),
                    'code' => $this->exception->getCode() ?? 0,
                ]
            ]
        ], JSON_THROW_ON_ERROR);

        $this->response
            ->getBody()
            ->write($jsonErrorMessage);

        $this->response->getBody()->rewind();

        return $this->response
            ->withStatus($this->getStatusCode(), $this->getUserMessage())
            ->withHeader('Content-Type', 'application/json');
    }


    private function getStatusCode(): int
    {
        if ($this->exception instanceof SongGuessrException) {
            return $this->exception->getStatusCode();
        }
        return self::DEFAULT_STATUS_CODE;
    }

    private function getUserMessage(): string
    {
        if ($this->exception instanceof SongGuessrException) {
            return $this->exception->getUserMessage();
        }
        if ($this->exception instanceof JsonException) {
            return self::JSON_USER_ERROR;
        }
        return self::DEFAULT_ERROR;
    }
}