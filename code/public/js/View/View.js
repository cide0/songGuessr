import {Div} from "../Elements/Div.js";
import {DomParser} from "../Utility/DomParser.js";

export class View{

    domParser = new DomParser();
    gameContainer = new Div('game-container');

    constructor(){
    }

    renderContainer(id){
        this.gameContainer.appendChild(this.createContainer(id));
    }

    createContainer(id){
        let container = this.domParser.createElement('div');
        container.setAttribute('id', id);
        return container;
    }
}