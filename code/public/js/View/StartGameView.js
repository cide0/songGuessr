import {View} from "./View.js";
import {Div} from "../Elements/Div.js";
import {Application} from "../Application.js";

export class StartGameView extends View{

    constructor() {
        super();
    }

    render(){
        this.renderContainer('start-container');

        let startButton = this.domParser.createElement('a');
        startButton.setAttribute('id', 'start-btn');
        startButton.innerHTML = 'Start game';

        startButton.addEventListener('click', async () => {
            let startContainer = new Div('start-container');
            startContainer.remove();

            let application = new Application();
            await application.startGame();
        });

        let startContainer = new Div('start-container');
        startContainer.appendChild(startButton);
    }
}