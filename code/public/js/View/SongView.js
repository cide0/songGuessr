import {SongPlaceholder} from "../Elements/SongPlaceholder.js";
import {View} from "./View.js";
import {Div} from "../Elements/Div.js";
import {PlayerPlaceholder} from "../Elements/PlayerPlaceholder.js";

export class SongView extends View{

    guessInputPlaceholder = 'Enter guess here';

    constructor(song) {
        super();
        this.song = song;
    }

    render() {
        this.renderContainer('song-container');
        this.renderSongName();
        this.renderGuess('song');
        this.renderPlayerName();
        this.renderGuess('player');
    }

    renderSongName(){
        let songNameContainer = this.createContainer('song-name-container');
        let songPlaceholderContainer = this.createContainer('song-placeholder-container');
        let songGuessContainer = this.createContainer('song-name-guess-container');

        songNameContainer.appendChild(songPlaceholderContainer);
        songNameContainer.appendChild(songGuessContainer);
        let songContainer = new Div('song-container');
        songContainer.appendChild(songNameContainer);

        new SongPlaceholder('song-placeholder-container', this.song.name);
    }

    renderGuess(type){
        let guessContainer = new Div(type + '-name-guess-container');

        let guessInput = this.domParser.createElement('input');
        guessInput.setAttribute('id', type + '-guess-input');
        guessInput.setAttribute('type', 'text');
        guessInput.setAttribute('placeholder', this.guessInputPlaceholder);
        guessInput.setAttribute('autocomplete', 'off');
        guessContainer.appendChild(guessInput);

        let guessButton = this.domParser.createElement('a');
        guessButton.setAttribute('id', type + '-guess-button');
        guessButton.innerHTML = 'Guess ' + type + ' name';
        guessContainer.appendChild(guessButton);

        guessButton.addEventListener('click', () => {
            let userGuess = guessInput.value;

            let guessedTypeValue = this.song.name;
            if(type === 'player') {
                guessedTypeValue = this.song.picker.firstName;
            }

            if(userGuess.toLowerCase() === guessedTypeValue.toLowerCase()) {
                confetti({
                    particleCount: 100,
                    spread: 70,
                    origin: { y: 0.2, x: 0.5 },
                    zIndex: -1,
                    colors: ['#1DB954', '#167237', '#212121', '#b3b3b3']
                });
                let placeholderContainer = new Div(type + '-placeholder-container');
                let placeholderChildren = placeholderContainer.htmlElement.children;
                for (let i = 0; i < guessedTypeValue.length; i++) {
                    placeholderChildren[i].innerHTML = guessedTypeValue[i];
                }
            }
        })
    }

    renderPlayerName() {
        let playerNameContainer = this.createContainer('player-name-container');
        let playerPlaceholderContainer = this.createContainer('player-placeholder-container');
        let playerGuessContainer = this.createContainer('player-name-guess-container');

        playerNameContainer.appendChild(playerPlaceholderContainer);
        playerNameContainer.appendChild(playerGuessContainer);
        let songContainer = new Div('song-container');
        songContainer.appendChild(playerNameContainer);

        new PlayerPlaceholder('player-placeholder-container', this.song.picker.firstName);
    }
}