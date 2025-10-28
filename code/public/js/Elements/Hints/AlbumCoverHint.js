import {Hint} from "./Hint.js";

export class AlbumCoverHint extends Hint{

    albumCoverPath = './../public/assets/img/album_covers/';

    constructor(hint, albumCoverSource){
        super(hint);
        this.albumCoverSource = albumCoverSource;
    }

    set(){
        let albumCoverImage = document.createElement('img');
        albumCoverImage.setAttribute('id', 'album-cover-hint-image');
        albumCoverImage.setAttribute('src', this.albumCoverPath + this.albumCoverSource);

        albumCoverImage.addEventListener('click', (e) => {
            e.stopPropagation();

            shrink();
            document.addEventListener('click', shrink);

            function shrink() {
                albumCoverImage.classList.toggle('zoom-in');
                document.removeEventListener('click', shrink);
            }
        });

        this.htmlElement.appendChild(albumCoverImage);
    }
}