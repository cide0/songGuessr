import {Application} from "./Application.js";
import {Button} from "./Elements/Button.js";

let startButton = new Button('start-btn');

startButton.addEventListener('click', async () => {
    let app = new Application();
    await app.runGame();
});