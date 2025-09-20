import {DomElement} from "./DomElement.js";

export class Div extends DomElement{
    constructor(elementId){
        super(elementId);
    }

    appendChild(childElement){
        this.htmlElement.appendChild(childElement);
    }
}