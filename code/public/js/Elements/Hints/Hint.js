import {DomElement} from "../DomElement.js";

export class Hint extends DomElement{
    constructor(hint){
        super('hint-element-' + hint.sequence);
        this.hint = hint;
    }
}