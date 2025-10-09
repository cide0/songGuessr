import {FetchWrapper} from "./Utility/FetchWrapper.js";
import {SongView} from "./View/SongView.js";
import {HintView} from "./View/HintView.js";
import {StartGameView} from "./View/StartGameView.js";

export class Application{

    fetchWrapper = new FetchWrapper();

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
        let song = await this.fetchWrapper.get('/start');
        await this.runGame(song);
    }

    async runGame(song) {
        let songView = new SongView(song);
        songView.render();

        let hintView = new HintView(song);
        hintView.render();
    }

    async loadSong() {
        return await this.fetchWrapper.get('/songs/random');
    }
}