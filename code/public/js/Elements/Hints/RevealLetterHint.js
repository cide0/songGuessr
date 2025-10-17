import {Hint} from "./Hint.js";
import {Div} from "../Div.js";

export class RevealLetterHint extends Hint{

    triedLetters = [];

    constructor(hint, songName){
        super(hint);
        this.songName = songName;
    }

    set(){
        let revealLetterLabelElement = document.createElement('div');
        revealLetterLabelElement.classList.add('hint-text-label');
        revealLetterLabelElement.setAttribute('id', 'reveal-letter-label');
        revealLetterLabelElement.innerHTML = 'Enter letter to reveal:';

        this.htmlElement.appendChild(revealLetterLabelElement);

        let revealLetterInputElement = document.createElement('input');
        revealLetterInputElement.classList.add('input-hint-element');
        revealLetterInputElement.setAttribute('type', 'text');
        revealLetterInputElement.setAttribute('maxlength', '1');
        revealLetterInputElement.addEventListener('input', (e) => this.revealLetter(e));

        this.htmlElement.appendChild(revealLetterInputElement);
    }

    revealLetter(e){
        let placeholderContainer = new Div('song-placeholder-container');
        let placeholderChildren = placeholderContainer.htmlElement.children;
        for (let i = 0; i < this.songName.length; i++) {
            if(e.target.value.toLowerCase() === this.songName[i].toLowerCase()) {
                for (let i = 0; i < this.songName.length; i++) {
                    if(e.target.value.toLowerCase() === this.songName[i].toLowerCase()) {
                        placeholderChildren[i].innerHTML = this.songName[i];
                    }
                }
                this.addToTriedLetters(e.target.value.toUpperCase());

                let addHintAudio = document.getElementById('add-hint-audio');
                if (addHintAudio.paused) {
                    addHintAudio.play();
                }else{
                    addHintAudio.currentTime = 0
                }

                let revealLetterLabelElement = new Div('reveal-letter-label');
                revealLetterLabelElement.htmlElement.innerHTML = 'Tried letters:';

                let guessedLetterContainer = document.createElement('div');
                guessedLetterContainer.classList.add('hint-text-value');
                guessedLetterContainer.innerHTML = this.triedLetters.join(' ');
                this.htmlElement.appendChild(guessedLetterContainer);
                e.target.remove();
                return;
            }
        }

        this.addToTriedLetters(e.target.value.toUpperCase());

        let failureAudio = document.getElementById('failure-audio');
        if (failureAudio.paused) {
            failureAudio.play();
        }else{
            failureAudio.currentTime = 0
        }

        e.target.classList.add('incorrect-shake');
        e.target.classList.add('incorrect-guess');
        e.target.value = '';
        setTimeout(() => {
            e.target.classList.remove('incorrect-shake');
        }, 300);
    }

    addToTriedLetters(character) {
        if (!this.triedLetters.includes(character)) {
            this.triedLetters.push(character);
        }
    }
}