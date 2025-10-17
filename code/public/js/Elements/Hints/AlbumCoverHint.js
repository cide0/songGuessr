import {Hint} from "./Hint.js";

export class AlbumCoverHint extends Hint{

    albumCoverPath = './../public/assets/img/album_covers/';

    constructor(hint, albumCoverSource){
        super(hint);
        this.albumCoverSource = albumCoverSource;
    }

    set(){
        let albumCoverImage = document.createElement('img');
        albumCoverImage.setAttribute('id', 'album-cover-hint-image');
        albumCoverImage.setAttribute('src', this.albumCoverPath + this.albumCoverSource);

        this.htmlElement.appendChild(albumCoverImage);
    }
}