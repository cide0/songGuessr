import {DomElement} from "./DomElement.js";
import {DomParser} from "../Utility/DomParser.js";

export class SongPlaceholder extends DomElement{

    domParser = new DomParser();
    specialCharsRegex = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;

    constructor(elementId, songName) {
        super(elementId);
        this.setPlaceholders(songName);
    }

    setPlaceholders(songName) {
        for (let i = 0; i < songName.length; i++) {

            if(this.isSpecialChar(songName[i]) || this.isSpace(songName[i])) {
                continue;
            }

            let placeholder = this.domParser.createElement('div');
            placeholder.classList.add('song-placeholder');
            this.htmlElement.appendChild(placeholder);
        }
    }

    isSpace(char) {
        if(char === ' '){
            let space = this.domParser.createElement('div');
            space.classList.add('song-space');
            this.htmlElement.appendChild(space);
            return true;
        }

        return false;
    }

    isSpecialChar(char) {
        if(this.specialCharsRegex.test(char)) {
            let specialChar = this.domParser.createElement('div');
            specialChar.innerHTML = char;
            specialChar.classList.add('song-special-char');
            this.htmlElement.appendChild(specialChar);
            return true;
        }

        return false;
    }
}