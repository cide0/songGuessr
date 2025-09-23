import {AlbumCoverHint} from "../Elements/Hints/AlbumCoverHint.js";

export class HintMapper{
    constructor(song) {
        this.song = song;
    }

    mapByType(hint) {
        switch(hint.type) {
            case 'albumCover':
                return new AlbumCoverHint(hint, this.song.albumCoverSource);
            default:
                return null;
        }
    }
}