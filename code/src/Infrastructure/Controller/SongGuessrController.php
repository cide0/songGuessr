<?php

namespace songguessr\Infrastructure\Controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class SongGuessrController
{
    public function __construct()
    {
    }

    public function comingSoon(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $response->getBody()->write('coming soon');
        return $response;
    }
}