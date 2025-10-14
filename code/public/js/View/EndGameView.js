import {View} from "./View.js";
import {Div} from "../Elements/Div.js";

export class EndGameView extends View{
    constructor() {
        super();
    }

    render(){
        this.renderContainer('end-container');

        let endMessage = this.domParser.createElement('div');
        endMessage.setAttribute('id', 'end-message-container');
        endMessage.innerHTML = 'You have guessed all songs for now, thank you for playing!';

        let restartGameButton = this.domParser.createElement('a');
        restartGameButton.setAttribute('id', 'restart-btn');
        restartGameButton.innerHTML = 'Restart game';

        let endContainer = new Div('end-container');
        endContainer.appendChild(endMessage);
        endContainer.appendChild(restartGameButton);
    }
}