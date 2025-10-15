import {AlbumCoverHint} from "../Elements/Hints/AlbumCoverHint.js";
import {AudioHint} from "../Elements/Hints/AudioHint.js";
import {AlbumNameHint} from "../Elements/Hints/AlbumNameHint.js";
import {ArtistNameHint} from "../Elements/Hints/ArtistNameHint.js";
import {RevealVowelsHint} from "../Elements/Hints/RevealVowelsHint.js";
import {ReleaseYearHint} from "../Elements/Hints/ReleaseYearHint.js";
import {MusicVideoHint} from "../Elements/Hints/MusicVideoHint.js";

export class HintMapper{
    constructor(song) {
        this.song = song;
    }

    mapByType(hint) {
        switch(hint.type) {
            case 'albumCover':
                return new AlbumCoverHint(hint, this.song.albumCoverSource);
            case 'audio':
                return new AudioHint(hint, this.song.audioSource);
            case 'albumName':
                return new AlbumNameHint(hint, this.song.album);
            case 'artistName':
                return new ArtistNameHint(hint, this.song.artist);
            case 'revealVowels':
                return new RevealVowelsHint(hint, this.song.name);
            case 'releaseYear':
                return new ReleaseYearHint(hint, this.song.released);
            case 'musicVideo10Seconds':
                return new MusicVideoHint(hint, this.song.videoSource);
            default:
                return null;
        }
    }
}