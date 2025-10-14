<?php

namespace songguessr\Domain\Service;

use songguessr\Domain\Model\SongModel;
use songguessr\Infrastructure\Storage\Persist\PickerPersist;
use songguessr\Infrastructure\Storage\Persist\SongPersist;
use songguessr\Infrastructure\Storage\Read\SongStorage;

class SongService
{
    public function __construct(
        private SongStorage $songStorage,
        private PickerPersist $pickerPersist,
        private SongPersist $songPersist,
    )
    {
    }

    public function getRandomSong(): SongModel
    {
        return $this->songStorage->loadRandomSong();
    }

    public function getSongById(int $songId): SongModel
    {
        return $this->songStorage->loadSongById($songId);
    }

    public function addSong(array $formData): void
    {
        $songModel = new SongModel($formData);

        $pickerId = $this->pickerPersist->persistPicker($songModel->getPicker());

        $this->songPersist->persistSong($songModel, $pickerId);
    }

    public function setSongAsGuessed(int $songId)
    {
        $this->songPersist->updateSongGuessedStatus($songId, 1);
    }
}