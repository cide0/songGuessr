<p align="center"><img src="./code/public/assets/icons/favicon.png" alt="icon" width="90"/></p>
<h1 align="center">SongGuessr</h1>
<p align="center">img src="https://img.shields.io/github/v/tag/cide0/songGuessr?label=latest%20version&style=flat-square"/></p>

SongGuessr is a fun web app that challenges you to guess the title of a song based on a variety of hints.
You can also add the person who chose the song to add another layer of difficulty.
If you want to play, you have to import the needed song data first. A description of how to do this can be found in the [Adding songs section](#adding-songs).

## Current Features

### Base Game Functionality

- Press the **Start game** button or the **Restart game** button at any time during a running game to start a new one.
- The songs will be presented one by one in a random order that changes for every game.
- The song name and the person's name (if set) are censored with an underscore for each character.
- A hint section is displayed at the bottom of the page for each song, more on how hints work can be found in the [Hints section](#hints).
- Animations and sound effects! :relaxed:

### Hints
- There are currently 10 different hint types available:
  1. **Album cover:** The album cover the song is from is displayed.
  2. **Album name:** The name of the album the song is from is displayed.
  3. **Artist image:** An image of the artist is displayed.
  4. **Artist name:** The name of the artist is displayed.
  5. **Audio:** The audio of the song can be played as long as preferred.
  6. **Genre:** The genre of the song is displayed.
  7. **Music video:** 10 random seconds of the music video of the song are shown.
  8. **Release year:** The year the song was released is displayed.
  9. **Reveal letter:** An input field will be displayed that allows you to reveal every occurrence of a single character in the song title. 
     You can try characters until you choose one that is contained in the song title. Afterward, it will also show you all the characters you tried.
  10. **Reveal vowels:** All vowels in the song title are revealed.

- There are a few rules regarding how these hint types work that should be kept in mind:
    - There are always 5 hint types available per song.
    - Out of the 10 hint types, 4 different ones are randomly selected for each song at the start of the game.
      This means that every time you restart the game, you will get a different set of hint types for the same song.
      **Important Note:** If needed song data is missing for any hint type, that hint type will not be available for that song and is automatically filtered out. More on that can be found in the [Adding songs section](#adding-songs).
    - The audio hint is always available as the 5th and final hint, so you can always listen to the song if you want to.
    - The hints can be unveiled in any order.
    - Only hint type **Reveal letter** or **Reveal vowels** can be used to reveal letters in the song title. They will never both be available for the same song.

### Adding Songs

## Setup

To set up the project, follow these steps:
1. Use the make target `install`.
2. Use the make target `up` to start the backend API.
3. Decide whether to use the live or test database by changing the `USE_TEST_DB` constant in `Configuration.php` to `false` for live or `true` for test.
4. If needed, copy `.env.example` to `.env` and adjust values like `MYSQL_ROOT_PASSWORD`, `DB_USERNAME`, `DB_NAME`, and `DB_HOST`.
4. The API should now be accessible at `http://localhost:88/`.
5. To run the game, simply open the `index.html` file in your web browser.

## Database Backups

To create a database backup, use the make target `backup`. The backup will be saved as a SQL file in the `docker/mysql/backups/` folder.

To load a database backup, use the make target `import-db-backup FILENAME={filename_of_backup}`.

To load a database backup for testing purposes, use the make target `reset-test-db FILENAME={filename_of_backup}`.

The SQL file should be located in the `docker/mysql/backups/` folder.
