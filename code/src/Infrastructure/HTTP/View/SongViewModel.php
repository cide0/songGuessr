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
        $serialized = [
            'id' => $this->songModel->getId(),
            'name' => $this->songModel->getName(),
            'artist' => $this->songModel->getArtist(),
            'guessed' => $this->songModel->isGuessed(),
            'audioSource' => $this->songModel->getAudioSource(),
            'videoSource' => $this->songModel->getVideoSource(),
            'album' => $this->songModel->getAlbum(),
            'albumCoverSource' => $this->songModel->getAlbumCoverSource(),
            'released' => $this->songModel->getReleased(),
            'genre' => $this->songModel->getGenre(),
            'artistImageSource' => $this->songModel->getArtistImageSource()
        ];

        if($this->songModel->getPicker() !== null) {
            $serialized['picker'] = PickerViewModel::fromPickerModel($this->songModel->getPicker());
        }

        return $serialized;
    }
}