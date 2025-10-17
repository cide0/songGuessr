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
        restartGameButton.addEventListener('click', async () => {
            if (confirm('Are you sure you want to restart the game?')) {
                let application = new Application();
                await application.restartGame();
            }
        });

        this.gameNavbar.appendChild(restartGameButton);
    }

    renderNavbarRight() {
        let gameNavbarRightContainer = this.createContainer('game-navbar-right-container');

        let revealSongButton = this.domParser.createElement('a');
        revealSongButton.setAttribute('id', 'reveal-song-btn');
        revealSongButton.innerHTML = 'Reveal song';
        revealSongButton.addEventListener('click', (e) => {
            this.revealSongEventListener(e);
        });

        let revealPlayerButton = this.domParser.createElement('a');
        revealPlayerButton.setAttribute('id', 'reveal-player-btn');
        revealPlayerButton.innerHTML = 'Reveal player';
        revealPlayerButton.addEventListener('click', (e) => {
            this.revealPlayerEventListener(e);
        });
        if(this.song.picker === undefined) {
            revealPlayerButton.style.display = 'none';
        }

        let nextSongButton = this.domParser.createElement('a');
        nextSongButton.setAttribute('id', 'next-song-btn');
        nextSongButton.classList.add('disabled-button');
        nextSongButton.innerHTML = 'Next song';
        nextSongButton.addEventListener('click', async () => {
            let application = new Application();
            await application.loadNextSong(this.song.id);
        });

        gameNavbarRightContainer.appendChild(revealSongButton);
        gameNavbarRightContainer.appendChild(revealPlayerButton);
        gameNavbarRightContainer.appendChild(nextSongButton);
        this.gameNavbar.appendChild(gameNavbarRightContainer);
    }

    revealSongEventListener(e) {
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

    revealPlayerEventListener(e){
        let revealAudio = document.getElementById('reveal-audio');
        if (revealAudio.paused) {
            revealAudio.play();
        }else{
            revealAudio.currentTime = 0
        }

        let playerPlaceholderContainer = new Div('player-placeholder-container');
        let playerPlaceholderChildren = playerPlaceholderContainer.htmlElement.children;
        for (let i = 0; i < this.song.picker.firstName.length; i++) {
            playerPlaceholderChildren[i].innerHTML = this.song.picker.firstName[i];
        }

        let playerGuessButton = this.domParser.getById('player-guess-button');
        playerGuessButton.classList.add('disabled-button');
        let playerGuessInput = this.domParser.getById('player-guess-input');
        playerGuessInput.disabled = true;
        e.target.classList.add('disabled-button');
    }
}