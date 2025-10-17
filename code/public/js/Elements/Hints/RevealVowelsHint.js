import {Hint} from "./Hint.js";
import {Div} from "../Div.js";

export class RevealVowelsHint extends Hint{

    vowelsRegex = /^[aeiou]$/;

    constructor(hint, songName){
        super(hint);
        this.songName = songName;
    }

    set(){
        let revealVowelsLabelElement = document.createElement('div');
        revealVowelsLabelElement.classList.add('hint-text-label');
        revealVowelsLabelElement.innerHTML = 'Revealed vowels:';

        this.htmlElement.appendChild(revealVowelsLabelElement);

        let revealVowelsValueElement = document.createElement('div');
        revealVowelsValueElement.classList.add('hint-text-value');
        revealVowelsValueElement.innerHTML = 'A E I O U';

        this.htmlElement.appendChild(revealVowelsValueElement);

        let placeholderContainer = new Div('song-placeholder-container');
        let placeholderChildren = placeholderContainer.htmlElement.children;
        for (let i = 0; i < this.songName.length; i++) {
            if(this.vowelsRegex.test(this.songName[i].toLowerCase())) {
                placeholderChildren[i].innerHTML = this.songName[i];
            }
        }
    }
}