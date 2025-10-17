<?php

namespace songguessr\Infrastructure\Storage\Persist;

use songguessr\Domain\Model\SongModel;
use songguessr\Infrastructure\Storage\MySqlClient;

class SongPersist
{
    public function __construct(private MySqlClient $mySqlClient)
    {
    }

    public function persistSong(SongModel $songModel, ?int $pickerId): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'INSERT INTO song (name, artist, guessed, picked_by, audio_source, video_source, album, album_cover_source, released, genre, artist_image_source)
                    VALUES (:name, :artist, 0, :pickerId, :audioSource, :videoSource, :album, :albumCoverSource, :released, :genre, :artistImageSource)'
        );
        $statement->bindValue('name', $songModel->getName());
        $statement->bindValue('artist', $songModel->getArtist());
        $statement->bindValue('pickerId', $pickerId);
        $statement->bindValue('audioSource', $songModel->getAudioSource());
        $statement->bindValue('videoSource', $songModel->getVideoSource());
        $statement->bindValue('album', $songModel->getAlbum());
        $statement->bindValue('albumCoverSource', $songModel->getAlbumCoverSource());
        $statement->bindValue('released', $songModel->getReleased());
        $statement->bindValue('genre', $songModel->getGenre());
        $statement->bindValue('artistImageSource', $songModel->getArtistImageSource());
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }

    public function updateSongGuessedStatus(int $songId, int $guessed): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'UPDATE song SET guessed = :guessed WHERE song_id = :songId'
        );
        $statement->bindValue('guessed', $guessed);
        $statement->bindValue('songId', $songId);
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }

    public function resetGuessedStatusForAllSongs(): void
    {
        $connection = $this->mySqlClient->connect();
        $statement = $connection->prepare(
            'UPDATE song SET guessed = 0'
        );
        $statement->execute();
        $this->mySqlClient->closeConnection();
    }
}