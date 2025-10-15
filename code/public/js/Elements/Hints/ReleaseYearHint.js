import {Hint} from "./Hint.js";

export class ReleaseYearHint extends Hint{
    constructor(hint, releaseYear){
        super(hint);
        this.releaseYear = releaseYear;
    }

    set(){
        this.htmlElement.innerHTML = '';

        let releaseYearLabelElement = document.createElement('div');
        releaseYearLabelElement.classList.add('hint-text-label');
        releaseYearLabelElement.innerHTML = 'Release year:';

        this.htmlElement.appendChild(releaseYearLabelElement);

        let releaseYearValueElement = document.createElement('div');
        releaseYearValueElement.classList.add('hint-text-value');
        releaseYearValueElement.innerHTML = this.releaseYear;

        this.htmlElement.appendChild(releaseYearValueElement);
    }
}