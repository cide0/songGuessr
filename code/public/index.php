<?php

namespace songguessr;
use DI\Container;
use Fig\Http\Message\StatusCodeInterface;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpNotFoundException;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use songguessr\Infrastructure\Controller\SongGuessrController;
use songguessr\Infrastructure\HTTP\Middleware\ErrorMiddleware;

require_once(__DIR__ . '/../vendor/autoload.php');

date_default_timezone_set('Europe/Berlin');
error_reporting(E_ALL);
ini_set('display_errors', 1);

$slimContainer = new Container();

$factory = new Factory(
    new Configuration()
);

$slimContainer->set(SongGuessrController::class, function () use ($factory) {
    return $factory->createSongGuessrController();
});

AppFactory::setContainer($slimContainer);
$slimApp = AppFactory::create();

$slimApp->get(
    '/',
    function (Request $request, Response $response) {
        $response->getBody()
            ->write(
                "Welcome to the SongGuessr API.\n" .
                "For details on using this service take a look at: " .
                "https://github.com/cide0/songGuessr\n"
            );

        return $response
            ->withStatus(StatusCodeInterface::STATUS_OK)
            ->withHeader('Content-Type', 'text/plain');
    }
);

$slimApp->group('/songguessr', function (RouteCollectorProxy $group) {
    $group->get(
        '/',
        SongGuessrController::class . ':comingSoon'
    );
    $group->get(
        '/start',
        SongGuessrController::class . ':startNewGame'
    );
    $group->get(
        '/clear',
        SongGuessrController::class . ':clearGameStatus'
    );
    $group->group('/songs', function (RouteCollectorProxy $group) {
        $group->get(
            '/random',
            SongGuessrController::class . ':getRandomSong'
        );

        $group->get(
            '/current',
            SongGuessrController::class . ':getCurrentSong'
        );

        $group->get(
            '/{songId}/hints/{sequenceNumber}',
            SongGuessrController::class . ':getSongHintBySequenceNumber'
        );

        $group->get(
            '/{songId}/guessed',
            SongGuessrController::class . ':setSongAsGuessed'
        );

        $group->get(
            '/{songId}/current',
            SongGuessrController::class . ':updateCurrentSong'
        );

        $group->post(
            '/add',
            SongGuessrController::class . ':addSong'
        );
    });
});

$slimApp->addRoutingMiddleware();

$errorHandler = $slimApp->addErrorMiddleware(true, true, true);
$errorHandler->setDefaultErrorHandler(new ErrorMiddleware());
$errorHandler->setErrorHandler(
    HttpNotFoundException::class,
    function (
        Request $request
    ) use (
        $slimApp,
        $factory,
        $slimContainer
    ) {
        $targetUrl = $request->getRequestTarget();
        $jsonErrorMessage = json_encode([
            'errors' => [
                [
                    'userMessage' => 'The resource you were looking for does not exist',
                    'internalMessage' => "The route {$targetUrl} does not exist for this service",
                    'code' => 404
                ]
            ]
        ], JSON_THROW_ON_ERROR);

        $response = $slimApp->getResponseFactory()->createResponse();
        $response->getBody()->write($jsonErrorMessage);
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(404);
    }
);

$slimApp->add(function (Request $request, $handler) {
    $response = $handler->handle($request);
    return $response
        ->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

$slimApp->run();


