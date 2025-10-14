import {View} from "./View.js";
import {Div} from "../Elements/Div.js";
import {Application} from "../Application.js";

export class GameNavbarView extends View{

    gameNavbar = this.createContainer('game-navbar');

    constructor(song) {
        super();
        this.song = song;
    }

    render(){
        this.renderContainer('game-navbar-container');
        this.renderUiAudioElements();
        this.renderNavbarLeft();
        this.renderNavbarRight();

        let gameNavbarContainer = new Div('game-navbar-container');
        gameNavbarContainer.appendChild(this.gameNavbar);
    }

    renderUiAudioElements() {
        let revealAudio = this.domParser.createElement('audio');
        revealAudio.setAttribute('id', 'reveal-audio');
        revealAudio.setAttribute('src', './../public/assets/audio/reveal-sound.wav');
        this.gameContainer.appendChild(revealAudio);
    }

    renderNavbarLeft() {
        let restartGameButton = this.domParser.createElement('a');
        restartGameButton.setAttribute('id', 'restart-game-btn');
        restartGameButton.innerHTML = 'Restart game';

        this.gameNavbar.appendChild(restartGameButton);
    }

    renderNavbarRight() {
        let gameNavbarRightContainer = this.createContainer('game-navbar-right-container');

        let revealButton = this.domParser.createElement('a');
        revealButton.setAttribute('id', 'reveal-btn');
        revealButton.innerHTML = 'Reveal';
        revealButton.addEventListener('click', (e) => {
            this.revealEventListener(e);
        });

        let nextSongButton = this.domParser.createElement('a');
        nextSongButton.setAttribute('id', 'next-song-btn');
        nextSongButton.classList.add('disabled-button');
        nextSongButton.innerHTML = 'Next song';
        nextSongButton.addEventListener('click', async () => {
            let application = new Application();
            await application.loadNextSong(this.song.id);
        });

        gameNavbarRightContainer.appendChild(revealButton);
        gameNavbarRightContainer.appendChild(nextSongButton);
        this.gameNavbar.appendChild(gameNavbarRightContainer);
    }

    revealEventListener(e) {
        let revealAudio = document.getElementById('reveal-audio');
        if (revealAudio.paused) {
            revealAudio.play();
        }else{
            revealAudio.currentTime = 0
        }

        let songPlaceholderContainer = new Div('song-placeholder-container');
        let songPlaceholderChildren = songPlaceholderContainer.htmlElement.children;
        for (let i = 0; i < this.song.name.length; i++) {
            songPlaceholderChildren[i].innerHTML = this.song.name[i];
        }

        let nextSongButton = this.domParser.getById('next-song-btn');
        nextSongButton.classList.remove('disabled-button');
        let songGuessButton = this.domParser.getById('song-guess-button');
        songGuessButton.classList.add('disabled-button');
        let songGuessInput = this.domParser.getById('song-guess-input');
        songGuessInput.disabled = true;
        e.target.classList.add('disabled-button');
    }
}