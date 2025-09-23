<?php

namespace songguessr\Infrastructure\HTTP\View;

use songguessr\Domain\Model\SongModel;

class SongViewModel implements ViewModel
{
    private function __construct(private SongModel $songModel)
    {
    }

    public static function fromSongModel(SongModel $songModel): SongViewModel
    {
        return new SongViewModel($songModel);
    }

    public function jsonSerialize(): array
    {
        return [
            'id' => $this->songModel->getId(),
            'name' => $this->songModel->getName(),
            'artist' => $this->songModel->getArtist(),
            'guessed' => $this->songModel->isGuessed(),
            'picker' => PickerViewModel::fromPickerModel($this->songModel->getPicker()),
            'audioSource' => $this->songModel->getAudioSource(),
            'videoSource' => $this->songModel->getVideoSource(),
            'album' => $this->songModel->getAlbum(),
            'albumCoverSource' => $this->songModel->getAlbumCoverSource()
        ];
    }
}