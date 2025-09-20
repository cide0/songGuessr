export class DomParser{
    constructor(){}

    getById(id){
        return document.getElementById(id);
    }

    createElement(elementType){
        return document.createElement(elementType);
    }
}