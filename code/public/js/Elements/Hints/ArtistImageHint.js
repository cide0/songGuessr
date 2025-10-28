import {Hint} from "./Hint.js";

export class ArtistImageHint extends Hint{

    artistImagePath = './../public/assets/img/artist_images/';

    constructor(hint, artistImageSource){
        super(hint);
        this.artistImageSource = artistImageSource;
    }

    set(){
        let artistImage = document.createElement('img');
        artistImage.setAttribute('id', 'artist-image-hint-image');
        artistImage.setAttribute('src', this.artistImagePath + this.artistImageSource);

        artistImage.addEventListener('click', (e) => {
            e.stopPropagation();

            shrink();
            document.addEventListener('click', shrink);

            function shrink() {
                artistImage.classList.toggle('zoom-in');
                document.removeEventListener('click', shrink);
            }
        });

        this.htmlElement.appendChild(artistImage);
    }
}