import {DomElement} from "./DomElement.js";
import {DomParser} from "../Utility/DomParser.js";

export class PlayerPlaceholder extends DomElement{

    domParser = new DomParser();

    constructor(elementId, playerName) {
        super(elementId);
        this.setPlaceholders(playerName);
    }

    setPlaceholders(playerName) {
        for (let i = 0; i < playerName.length; i++) {
            let placeholder = this.domParser.createElement('div');
            placeholder.classList.add('player-placeholder');
            this.htmlElement.appendChild(placeholder);
        }
    }
}