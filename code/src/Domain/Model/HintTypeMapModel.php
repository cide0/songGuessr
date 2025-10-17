<?php

namespace songguessr\Domain\Model;

class HintTypeMapModel
{
    private array $hintTypeMap = [];
    private const string ALBUM_COVER_HINT_TYPE = 'albumCover';
    private const string ALBUM_NAME_HINT_TYPE = 'albumName';
    private const string ARTIST_IMAGE_HINT_TYPE = 'artistImage';
    private const string GENRE_HINT_TYPE = 'genre';
    private const string MUSIC_VIDEO_10_SECONDS_HINT_TYPE = 'musicVideo10Seconds';

    public function __construct(array $data) {
        $this->generate($data);
    }

    private function generate(array $data)
    {
        foreach ($data as $hint) {
            $this->hintTypeMap[$hint['type']] = $hint['hint_id'];
        }
    }

    public function getHintTypeMap(): array
    {
        return $this->hintTypeMap;
    }

    public function removeHintTypeFromMap(string $hintType, array &$hintTypeMap): void
    {
        unset($hintTypeMap[$hintType]);
    }

    public function getAlbumCoverHintType(): string
    {
        return self::ALBUM_COVER_HINT_TYPE;
    }

    public function getAlbumNameHintType(): string
    {
        return self::ALBUM_NAME_HINT_TYPE;
    }

    public function getArtistImageHintType(): string
    {
        return self::ARTIST_IMAGE_HINT_TYPE;
    }

    public function getGenreHintType(): string
    {
        return self::GENRE_HINT_TYPE;
    }

    public function getMusicVideo10SecondsHintType(): string
    {
        return self::MUSIC_VIDEO_10_SECONDS_HINT_TYPE;
    }
}