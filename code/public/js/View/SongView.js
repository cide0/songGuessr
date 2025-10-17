import {SongPlaceholder} from "../Elements/SongPlaceholder.js";
import {View} from "./View.js";
import {Div} from "../Elements/Div.js";
import {PlayerPlaceholder} from "../Elements/PlayerPlaceholder.js";

export class SongView extends View{

    guessInputPlaceholder = 'Enter guess here';
    guessTypePlayer = 'player';
    guessTypeSong = 'song';

    constructor(song) {
        super();
        this.song = song;
    }

    render() {
        this.renderContainer('song-container');
        this.renderUiAudioElements();
        this.renderSongName();
        this.renderGuess(this.guessTypeSong);
        if(this.song.picker !== undefined) {
            this.renderPlayerName();
            this.renderGuess(this.guessTypePlayer);
        }
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
        guessInput.addEventListener('input', () => {
            guessInput.classList.remove('incorrect-guess');
        });
        guessContainer.appendChild(guessInput);

        let guessButton = this.domParser.createElement('a');
        guessButton.setAttribute('id', type + '-guess-button');
        guessButton.innerHTML = 'Guess ' + type + ' name';
        guessContainer.appendChild(guessButton);

        guessButton.addEventListener('click', () => {
            this.guessEventListener(guessInput, type)
        });

        guessInput.addEventListener('keydown', (e) => {
            if(e.key === 'Enter'){
                this.guessEventListener(guessInput, type)
            }
        });
    }

    guessEventListener(guessInput, type){
        let userGuess = guessInput.value;

        let guessedTypeValue = this.song.name;
        if(type === this.guessTypePlayer) {
            guessedTypeValue = this.song.picker.firstName;
        }

        if(userGuess.toLowerCase() === guessedTypeValue.toLowerCase()) {
            let successAudio = document.getElementById('success-audio');
            if (successAudio.paused) {
                successAudio.play();
            }else{
                successAudio.currentTime = 0
            }

            confetti({
                particleCount: 250,
                spread: 100,
                origin: { y: 0.22, x: 0.5 },
                zIndex: -1,
                colors: ['#1DB954', '#167237', '#212121', '#b3b3b3']
            });

            let placeholderContainer = new Div(type + '-placeholder-container');
            let placeholderChildren = placeholderContainer.htmlElement.children;
            for (let i = 0; i < guessedTypeValue.length; i++) {
                placeholderChildren[i].innerHTML = guessedTypeValue[i];
            }

            if(type === this.guessTypeSong) {
                let nextSongButton = document.getElementById('next-song-btn');
                nextSongButton.classList.remove('disabled-button');
            }

            let revealButton = document.getElementById('reveal-' + type + '-btn');
            revealButton.classList.add('disabled-button');

            let guessButton = document.getElementById(type + '-guess-button');
            guessButton.classList.add('disabled-button');
            guessInput.disabled = true;
        } else {
            let failureAudio = document.getElementById('failure-audio');
            if (failureAudio.paused) {
                failureAudio.play();
            }else{
                failureAudio.currentTime = 0
            }

            guessInput.classList.add('incorrect-shake');
            guessInput.classList.add('incorrect-guess');
            setTimeout(() => {
                guessInput.classList.remove('incorrect-shake');
                guessInput.setAttribute('placeholder', this.guessInputPlaceholder);
            }, 300);
        }
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

    renderUiAudioElements() {
        let successAudio = this.domParser.createElement('audio');
        successAudio.setAttribute('id', 'success-audio');
        successAudio.setAttribute('src', './../public/assets/audio/success-sound.mp3');
        this.gameContainer.appendChild(successAudio);

        let failureAudio = this.domParser.createElement('audio');
        failureAudio.setAttribute('id', 'failure-audio');
        failureAudio.setAttribute('src', './../public/assets/audio/failure-sound.mp3');
        this.gameContainer.appendChild(failureAudio);
    }
}