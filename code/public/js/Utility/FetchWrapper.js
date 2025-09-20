export class FetchWrapper{
    requestUrl = 'http://localhost:88/songguessr';

    constructor(){
    }

    async get(url){
        return await fetch(this.requestUrl + url).then(response => response.json());
    }
}