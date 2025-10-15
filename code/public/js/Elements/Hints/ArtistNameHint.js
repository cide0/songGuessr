import {Hint} from "./Hint.js";

export class ArtistNameHint extends Hint{
    constructor(hint, artistName){
        super(hint);
        this.artistName = artistName;
    }

    set(){
        this.htmlElement.innerHTML = '';

        let artistNameLabelElement = document.createElement('div');
        artistNameLabelElement.classList.add('hint-text-label');
        artistNameLabelElement.innerHTML = 'Artist:';

        this.htmlElement.appendChild(artistNameLabelElement);

        let artistNameValueElement = document.createElement('div');
        artistNameValueElement.classList.add('hint-text-value');
        artistNameValueElement.innerHTML = this.artistName;

        this.htmlElement.appendChild(artistNameValueElement);
    }
}