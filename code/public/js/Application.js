import {FetchWrapper} from "./Utility/FetchWrapper.js";
import {SongView} from "./View/SongView.js";
import {Div} from "./Elements/Div.js";
import {HintView} from "./View/HintView.js";

export class Application{

    fetchWrapper = new FetchWrapper();

    constructor(){
        this.removeStartContainer();
    }

    removeStartContainer(){
        let startContainer = new Div('start-container');
        startContainer.remove();
    }

    async runGame() {
        let song = await this.loadSong();

        let songView = new SongView(song);
        songView.render();

        let hintView = new HintView(song);
        hintView.render();
    }

    async loadSong() {
        return await this.fetchWrapper.get('/songs/random');
    }
}