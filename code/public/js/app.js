import {Application} from "./Application.js";

let startBtn = document.getElementById('start-btn');

startBtn.addEventListener('click', () => {
    let app = new Application();
    app.start();
});