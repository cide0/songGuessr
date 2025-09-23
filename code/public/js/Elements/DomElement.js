import {DomParser} from "../Utility/DomParser.js";

export class DomElement{
    constructor(elementId){
        let domParser = new DomParser()
        this.htmlElement = domParser.getById(elementId);
    }

    remove(){
        this.htmlElement.remove();
    }
}