import {AlbumCoverHint} from "../Elements/Hints/AlbumCoverHint.js";
import {AudioHint} from "../Elements/Hints/AudioHint.js";
import {AlbumNameHint} from "../Elements/Hints/AlbumNameHint.js";
import {ArtistNameHint} from "../Elements/Hints/ArtistNameHint.js";
import {RevealVowelsHint} from "../Elements/Hints/RevealVowelsHint.js";
import {ReleaseYearHint} from "../Elements/Hints/ReleaseYearHint.js";
import {MusicVideoHint} from "../Elements/Hints/MusicVideoHint.js";
import {RevealLetterHint} from "../Elements/Hints/RevealLetterHint.js";
import {GenreHint} from "../Elements/Hints/GenreHint.js";
import {ArtistImageHint} from "../Elements/Hints/ArtistImageHint.js";

export class HintMapper{
    constructor(song) {
        this.song = song;
    }

    mapByType(hint) {
        switch(hint.type) {
            case 'albumCover':
                return new AlbumCoverHint(hint, this.song.albumCoverSource);
            case 'artistImage':
                return new ArtistImageHint(hint, this.song.artistImageSource);
            case 'audio':
                return new AudioHint(hint, this.song.audioSource);
            case 'albumName':
                return new AlbumNameHint(hint, this.song.album);
            case 'artistName':
                return new ArtistNameHint(hint, this.song.artist);
            case 'genre':
                return new GenreHint(hint, this.song.genre);
            case 'revealVowels':
                return new RevealVowelsHint(hint, this.song.name);
            case 'revealLetter':
                return new RevealLetterHint(hint, this.song.name);
            case 'releaseYear':
                return new ReleaseYearHint(hint, this.song.released);
            case 'musicVideo10Seconds':
                return new MusicVideoHint(hint, this.song.videoSource);
            default:
                return null;
        }
    }
}