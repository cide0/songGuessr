<?php

namespace songguessr\Infrastructure\HTTP;

use Psr\Http\Message\ResponseInterface;
use songguessr\Infrastructure\HTTP\View\ViewModel;

class ResponseHandler
{
    public static function handle(
        ResponseInterface $response,
        ViewModel $viewModel,
        int $responseCode
    ): ResponseInterface {
        $response->getBody()->write(json_encode($viewModel, JSON_THROW_ON_ERROR));
        return $response->withStatus($responseCode)->withHeader('Content-Type', 'application/json');
    }
}