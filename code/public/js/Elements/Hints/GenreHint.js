import {Hint} from "./Hint.js";

export class GenreHint extends Hint{
    constructor(hint, genre){
        super(hint);
        this.genre = genre;
    }

    set(){
        let genreLabelElement = document.createElement('div');
        genreLabelElement.classList.add('hint-text-label');
        genreLabelElement.innerHTML = 'Genre:';

        this.htmlElement.appendChild(genreLabelElement);

        let genreValueElement = document.createElement('div');
        genreValueElement.classList.add('hint-text-value');
        genreValueElement.innerHTML = this.genre;

        this.htmlElement.appendChild(genreValueElement);
    }
}