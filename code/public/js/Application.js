import {FetchWrapper} from "./Utility/FetchWrapper.js";
import {SongView} from "./View/SongView.js";
import {HintView} from "./View/HintView.js";
import {StartGameView} from "./View/StartGameView.js";
import {GameNavbarView} from "./View/GameNavbarView.js";
import {Div} from "./Elements/Div.js";
import {DomParser} from "./Utility/DomParser.js";
import {EndGameView} from "./View/EndGameView.js";

export class Application{

    fetchWrapper = new FetchWrapper();
    domParser = new DomParser();

    constructor(){
    }

    async init(){
        let currentSong = await this.fetchWrapper.get('/songs/current');
        if(currentSong.errors === undefined) {
            await this.runGame(currentSong);
        } else {
            let startGameView = new StartGameView();
            startGameView.render();
        }
    }

    async startGame(){
        await this.fetchWrapper.get('/hints/reroll');
        let song = await this.fetchWrapper.get('/start');
        if(await this.isValid(song)) {
            await this.runGame(song);
        }
    }

    async loadNextSong(previousSongId){
        await this.fetchWrapper.get('/songs/' + previousSongId + '/guessed');

        this.resetView();

        let song = await this.fetchWrapper.get('/songs/random');
        if(await this.isValid(song)) {
            await this.fetchWrapper.get('/songs/' + song.id + '/current');
            await this.runGame(song);
        }
    }

    async runGame(song) {
        this.playSoundForNextSong();

        let gameNavbarView = new GameNavbarView(song);
        gameNavbarView.render();

        let songView = new SongView(song);
        songView.render();

        let hintView = new HintView(song);
        hintView.render();
    }

    async isValid(song) {
        if(song.errors !== undefined) {
            await this.fetchWrapper.get('/clear');

            let endGameView = new EndGameView();
            endGameView.render();

            return false;
        }

        return true;
    }

    playSoundForNextSong() {
        let nextSongAudio = this.domParser.createElement('audio');
        nextSongAudio.setAttribute('src', './../public/assets/audio/next-song-sound.mp3');
        if (nextSongAudio.paused) {
            nextSongAudio.play();
        }else{
            nextSongAudio.currentTime = 0
        }
    }

    async restartGame() {
        await this.fetchWrapper.get('/clear');
        await this.fetchWrapper.get('/songs/reset');
        this.resetView();
        await this.init();
    }

    resetView() {
        let previousGameContainer = new Div('game-container');
        previousGameContainer.remove();

        let newGameContainer = this.domParser.createElement('div')
        newGameContainer.setAttribute('id', 'game-container');
        document.body.appendChild(newGameContainer);
    }
}