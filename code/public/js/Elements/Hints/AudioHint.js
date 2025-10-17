import {Hint} from "./Hint.js";

export class AudioHint extends Hint{

    audioPath = './../public/assets/audio/song_audio/';

    constructor(hint, audioSource){
        super(hint);
        this.audioSource = audioSource;
    }

    set(){
        let audioElement = document.createElement('audio');
        audioElement.setAttribute('id', 'audio-hint-element');
        audioElement.setAttribute('src', this.audioPath + this.audioSource);
        audioElement.setAttribute('controls', 'controls');
        audioElement.setAttribute('type', 'audio/mpeg');

        this.htmlElement.appendChild(audioElement);
    }
}