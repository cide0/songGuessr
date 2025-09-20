import {DomElement} from "./DomElement.js";

export class Button extends DomElement{
    constructor(elementId){
        super(elementId);
    }

    addEventListener(eventType, callback){
        this.htmlElement.addEventListener(eventType, callback);
    }
}