<?php

namespace songguessr\Infrastructure\Controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use songguessr\Application\Handler\GetHintHandler;
use songguessr\Application\Handler\GetSongHandler;
use songguessr\Infrastructure\HTTP\ResponseHandler;
use songguessr\Infrastructure\HTTP\View\HintViewModel;
use songguessr\Infrastructure\HTTP\View\SongViewModel;

class SongGuessrController
{
    private const int HTTP_OK = 200;

    public function __construct(
        private GetSongHandler $getSongHandler,
        private GetHintHandler $getHintHandler,
    )
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

    public function getRandomSong(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        return ResponseHandler::handle(
            $response,
            SongViewModel::fromSongModel($this->getSongHandler->handleGetRandomSong()),
            self::HTTP_OK
        );
    }

    public function getSongHintBySequenceNumber(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        return ResponseHandler::handle(
            $response,
            HintViewModel::fromHintModel(
                $this->getHintHandler->handleGetSongHintBySequenceNumber(
                    (int) $args['songId'],
                    (int) $args['sequenceNumber']
                )
            ),
            self::HTTP_OK
        );
    }
}