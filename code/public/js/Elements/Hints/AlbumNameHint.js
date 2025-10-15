import {Hint} from "./Hint.js";

export class AlbumNameHint extends Hint{
    constructor(hint, albumName){
        super(hint);
        this.albumName = albumName;
    }

    set(){
        this.htmlElement.innerHTML = '';

        let albumNameLabelElement = document.createElement('div');
        albumNameLabelElement.classList.add('hint-text-label');
        albumNameLabelElement.innerHTML = 'Album Name:';

        this.htmlElement.appendChild(albumNameLabelElement);

        let albumNameValueElement = document.createElement('div');
        albumNameValueElement.classList.add('hint-text-value');
        albumNameValueElement.innerHTML = this.albumName;

        this.htmlElement.appendChild(albumNameValueElement);
    }
}