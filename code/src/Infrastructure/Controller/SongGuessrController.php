<?php

namespace songguessr\Infrastructure\Controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use songguessr\Application\Handler\GameStatusHandler;
use songguessr\Application\Handler\GetHintHandler;
use songguessr\Application\Handler\SongHandler;
use songguessr\Domain\Exception\SongGuessrException;
use songguessr\Infrastructure\HTTP\ResponseHandler;
use songguessr\Infrastructure\HTTP\View\HintViewModel;
use songguessr\Infrastructure\HTTP\View\SongViewModel;

class SongGuessrController
{
    private const int HTTP_OK = 200;

    public function __construct(
        private SongHandler       $songHandler,
        private GetHintHandler    $getHintHandler,
        private GameStatusHandler $gameStatusHandler
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

    public function startNewGame(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $songModel = $this->songHandler->handleGetRandomSong();
        $this->gameStatusHandler->handleStartNewGame($songModel->getId());

        return ResponseHandler::handle(
            $response,
            SongViewModel::fromSongModel($songModel),
            self::HTTP_OK
        );
    }

    public function clearGameStatus(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $this->gameStatusHandler->handleClearGameStatus();

        return ResponseHandler::handle(
            $response,
            ['message' => 'Game status has been cleared'],
            self::HTTP_OK
        );
    }

    public function getCurrentSong(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $currentSongId = $this->gameStatusHandler->handleGetCurrentSongId();
        $songModel = $this->songHandler->handleGetSongById($currentSongId);

        return ResponseHandler::handle(
            $response,
            SongViewModel::fromSongModel($songModel),
            self::HTTP_OK
        );
    }

    public function getRandomSong(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        return ResponseHandler::handle(
            $response,
            SongViewModel::fromSongModel($this->songHandler->handleGetRandomSong()),
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

    public function addSong(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $formData = $request->getParsedBody();
        if($formData === null) {
            throw new SongGuessrException('Song could not be added, no data received!', 404);
        }

        $this->songHandler->handleAddSong($formData);

        return ResponseHandler::handle(
            $response,
            ['message' => 'Song has been added successfully'],
            self::HTTP_OK
        );
    }

    public function setSongAsGuessed(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $songId = (int) $args['songId'];

        $this->songHandler->handleSetSongAsGuessed($songId);

        return ResponseHandler::handle(
            $response,
            ['message' => "Song with id $songId has been set as guessed"],
            self::HTTP_OK
        );
    }

    public function updateCurrentSong(
        ServerRequestInterface $request,
        ResponseInterface $response,
        array $args
    ): ResponseInterface {
        $songId = (int) $args['songId'];

        $this->gameStatusHandler->handleUpdateCurrentSong($songId);

        return ResponseHandler::handle(
            $response,
            ['message' => "Song with id $songId has been set as current song"],
            self::HTTP_OK
        );
    }
}