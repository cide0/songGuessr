import {View} from "./View.js";
import {Div} from "../Elements/Div.js";
import {FetchWrapper} from "../Utility/FetchWrapper.js";
import {HintMapper} from "../Utility/HintMapper.js";

export class HintView extends View{

    maxHints = 5;
    loadedHints = 0;
    fetchWrapper = new FetchWrapper();

    constructor(song) {
        super();
        this.song = song;
        this.hintMapper = new HintMapper(this.song);
    }

    render() {
        this.renderContainer('hint-container');
        this.renderUiAudioElements();
        this.renderHeader();
        this.renderHintPlaceholders();
    }

    renderHeader() {
        let hintHeaderContainer = this.createContainer('hint-header-container');

        let hintHeaderTitle = this.domParser.createElement('div');
        hintHeaderTitle.setAttribute('id', 'hint-header-title');
        hintHeaderTitle.innerHTML = 'Hints:';

        let hintCounter = this.domParser.createElement('div');
        hintCounter.setAttribute('id', 'hint-counter');
        hintCounter.innerHTML = '0|' + this.maxHints;

        hintHeaderContainer.appendChild(hintHeaderTitle);
        hintHeaderContainer.appendChild(hintCounter);

        let hintElementContainer = this.createContainer('hint-element-container');

        let hintContainer = new Div('hint-container');
        hintContainer.appendChild(hintHeaderContainer);
        hintContainer.appendChild(hintElementContainer);
    }

    renderHintPlaceholders() {
        for(let sequence = 1; sequence < this.maxHints+1; sequence++) {
            let hintElement = this.domParser.createElement('div');
            hintElement.setAttribute('id', 'hint-element-' + sequence);
            hintElement.classList.add('hint-element');

            let hintPlaceholder = this.domParser.createElement('div');
            hintPlaceholder.classList.add('hint-placeholder');

            let hintPlaceholderPlus = this.domParser.createElement('div');
            hintPlaceholderPlus.classList.add('hint-placeholder-plus');
            hintPlaceholderPlus.innerHTML = '+';

            let hintPlaceholderText = this.domParser.createElement('div');
            hintPlaceholderText.classList.add('hint-placeholder-text');
            hintPlaceholderText.innerHTML = 'Load hint';

            hintPlaceholder.appendChild(hintPlaceholderPlus);
            hintPlaceholder.appendChild(hintPlaceholderText);

            hintElement.appendChild(hintPlaceholder);

            let hintElementContainer = new Div('hint-element-container');
            hintElementContainer.appendChild(hintElement);

            this.setEventListenerForHintLoading(hintElement, sequence);
        }
    }

    setEventListenerForHintLoading(hintElement, sequence) {
        hintElement.addEventListener('click', async () => {
            let addHintAudio = document.getElementById('add-hint-audio');
            if (addHintAudio.paused) {
                addHintAudio.play();
            }else{
                addHintAudio.currentTime = 0
            }

            let hint = await this.fetchWrapper.get('/songs/' + this.song.id + '/hints/' + sequence);
            let mappedHint = this.hintMapper.mapByType(hint);
            mappedHint.set();

            this.loadedHints++;
            let hintCounter = new Div('hint-counter');
            hintCounter.remove();
            let hintHeaderContainer = new Div('hint-header-container');
            let newHintCounter = this.domParser.createElement('div');
            newHintCounter.setAttribute('id', 'hint-counter');
            newHintCounter.innerHTML = this.loadedHints + '|' + this.maxHints;
            hintHeaderContainer.appendChild(newHintCounter);
        }, {once: true});
    }

    renderUiAudioElements() {
        let addHintAudio = this.domParser.createElement('audio');
        addHintAudio.setAttribute('id', 'add-hint-audio');
        addHintAudio.setAttribute('src', './../public/assets/audio/add-hint-sound.mp3');
        this.gameContainer.appendChild(addHintAudio);
    }
}