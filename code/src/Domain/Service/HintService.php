<?php

namespace songguessr\Domain\Service;

use songguessr\Domain\Model\HintModel;
use songguessr\Domain\Model\HintTypeMapModel;
use songguessr\Domain\Model\SongModel;
use songguessr\Infrastructure\Storage\Persist\HintPersist;
use songguessr\Infrastructure\Storage\Read\HintStorage;
use songguessr\Infrastructure\Storage\Read\SongStorage;

class HintService
{
    private const int AUDIO_HINT_ID = 4;
    private const int TOTAL_RANDOM_HINTS_PER_SONG = 4;

    public function __construct(
        private HintStorage $hintStorage,
        private HintPersist $hintPersist,
        private SongStorage $songStorage,
    )
    {
    }

    public function getSongHintBySequenceNumber(int $songId, int $sequenceNumber): HintModel
    {
        return $this->hintStorage->loadSongHintBySequenceNumber($songId, $sequenceNumber);
    }

    public function clearHints()
    {
        $this->hintPersist->clearHints();
    }

    public function generateHintsForAllSongs(): void
    {
        $songModels = $this->songStorage->loadAllSongs();
        $hintTypeMapModel = $this->hintStorage->loadHintTypeMap(self::AUDIO_HINT_ID);

        $hintModels = [];
        foreach ($songModels as $songModel) {
            $hintTypeMapForSong = $this->createHintTypeMapForSong($songModel, $hintTypeMapModel);

            $hintModelsForSong = $this->generateRandomHintsForSong($songModel->getId(), $hintTypeMapForSong);
            $hintModels = array_merge($hintModels, $hintModelsForSong);

            $hintModels[] = $this->generateAudioHintForSong($songModel->getId());
        }

        $this->hintPersist->persistHints($hintModels);
    }

    private function createHintTypeMapForSong(SongModel $songModel, HintTypeMapModel $hintTypeMapModel): array
    {
        $hintTypeMap = $hintTypeMapModel->getHintTypeMap();

        if($songModel->getAlbumCoverSource() === null){
            $hintTypeMapModel->removeHintTypeFromMap($hintTypeMapModel->getAlbumCoverHintType(), $hintTypeMap);
        }

        if($songModel->getAlbum() === null){
            $hintTypeMapModel->removeHintTypeFromMap($hintTypeMapModel->getAlbumNameHintType(), $hintTypeMap);
        }

        if($songModel->getArtistImageSource() === null){
            $hintTypeMapModel->removeHintTypeFromMap($hintTypeMapModel->getArtistImageHintType(), $hintTypeMap);
        }

        if($songModel->getGenre() === null){
            $hintTypeMapModel->removeHintTypeFromMap($hintTypeMapModel->getGenreHintType(), $hintTypeMap);
        }

        if($songModel->getVideoSource() === null){
            $hintTypeMapModel->removeHintTypeFromMap($hintTypeMapModel->getMusicVideo10SecondsHintType(), $hintTypeMap);
        }

        return $hintTypeMap;
    }

    /**
     * @return HintModel[]
     */
    private function generateRandomHintsForSong(?int $songId, array $hintTypeMapForSong): array
    {
        $hintModelsForSong = [];
        for($i = 0; $i < self::TOTAL_RANDOM_HINTS_PER_SONG; $i++) {
            $hintModelData = [];
            $hintModelData['song_id'] = $songId;
            $hintModelData['sequence'] = $i + 1;

            shuffle($hintTypeMapForSong);
            $hintModelData['hint_id'] = array_pop($hintTypeMapForSong);

            $hintModelsForSong[] = new HintModel($hintModelData);
        }

        return $hintModelsForSong;
    }

    private function generateAudioHintForSong(?int $songId): HintModel
    {
        $hintModelData = [];
        $hintModelData['song_id'] = $songId;
        $hintModelData['sequence'] = self::TOTAL_RANDOM_HINTS_PER_SONG + 1; // Audio hint is always the last hint
        $hintModelData['hint_id'] = self::AUDIO_HINT_ID;

        return new HintModel($hintModelData);
    }
}