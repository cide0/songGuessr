import {Hint} from "./Hint.js";

export class MusicVideoHint extends Hint{

    videoPath = './../public/assets/video/music_videos/';
    videoPlayDuration = 10; // in seconds

    constructor(hint, musicVideoSource){
        super(hint);
        this.musicVideoSource = musicVideoSource;
    }

    set(){
        let musicVideoElement = document.createElement('video');
        musicVideoElement.setAttribute('id', 'music-video-element');
        musicVideoElement.setAttribute('src', this.videoPath + this.musicVideoSource);
        musicVideoElement.setAttribute('controls', 'controls');
        musicVideoElement.setAttribute('type', 'audio/mp4');
        musicVideoElement.muted = true;
        musicVideoElement.autoplay = true;

        musicVideoElement.addEventListener('play', () => {
            musicVideoElement.requestFullscreen();
        });

        musicVideoElement.addEventListener('loadedmetadata', () => {
            let maxStartTime = Math.max(0, musicVideoElement.duration - this.videoPlayDuration);

            musicVideoElement.currentTime = Math.random() * maxStartTime;
            musicVideoElement.play();

            setTimeout(() => {
                musicVideoElement.pause();
            }, this.videoPlayDuration * 1000);
        });

        this.htmlElement.appendChild(musicVideoElement);
    }
}