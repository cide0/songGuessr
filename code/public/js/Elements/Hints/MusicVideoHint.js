import {Hint} from "./Hint.js";

export class MusicVideoHint extends Hint{

    videoPath = './../public/assets/video/music_videos/';

    constructor(hint, musicVideoSource){
        super(hint);
        this.musicVideoSource = musicVideoSource;
    }

    set(){
        this.htmlElement.innerHTML = '';

        let musicVideoElement = document.createElement('video');
        musicVideoElement.setAttribute('id', 'music-video-element');
        musicVideoElement.setAttribute('src', this.videoPath + this.musicVideoSource);
        musicVideoElement.setAttribute('controls', 'controls');
        musicVideoElement.setAttribute('type', 'audio/mp4');
        musicVideoElement.muted = true;
        musicVideoElement.autoplay = true;

        musicVideoElement.addEventListener('loadedmetadata', () => {
            musicVideoElement.currentTime = 0;
            musicVideoElement.play();
            setTimeout(() => {
                musicVideoElement.pause();
            }, 10000);
        });

        this.htmlElement.appendChild(musicVideoElement);
    }
}