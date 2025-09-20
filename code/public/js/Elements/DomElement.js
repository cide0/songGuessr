import {DomParser} from "../Utility/DomParser.js";

export class DomElement{
    constructor(elementId){
        let domParser = new DomParser()
        this.htmlElement = domParser.getById(elementId);
    }

    getCurrentValue(){
        return this.htmlElement.value;
    }

    getInnerHtml(){
        return this.htmlElement.innerHTML;
    }

    remove(){
        this.htmlElement.remove();
    }
}