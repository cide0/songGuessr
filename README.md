<p align="center"><img src="./code/public/assets/icons/favicon.png" alt="icon" width="90"/></p>
<h1 align="center">SongGuessr</h1>
<p align="center"><img src="https://img.shields.io/github/v/tag/cide0/songGuessr?label=latest%20version&style=flat-square"/></p>

**SongGuessr** is a fun web app that challenges you to guess the title of a song based on a variety of hints. 

You can also add the person's name who chose the song to add another layer of difficulty.

If you want to play, you have to import the needed song data first after running the [Setup steps](#setup). A description of how to do this can be found in the [Adding songs section](#adding-songs).

## Current Features

### Base Game Functionality

- Press the **Start game** button or the **Restart game** button at any time during a running game to start a new one. This fully resets the current game state and re-selects the song hints for every song.
- The songs will be presented one by one in a random order that changes for every game.
- The song name and the player name (if set) are censored with an underscore for each character.
- A hints section is displayed at the bottom of the page for each song, more on how hints work can be found in the [Hints section](#hints).
- Press the **Reveal song** button to reveal the current song title if you are stuck.
- Press the **Reveal player** button (if a player name is set) to reveal the current player name if you are stuck.
- Press the **Next song** button to load the next song.
- Click on any image in the hints sections to make it bigger.
- The game automatically stores which songs have been guessed already and what song is currently active, so you can re-open the page and continue where you left off.
- When all songs have been guessed, a message is displayed and the game can be restarted.
- Animations and sound effects! :relaxed:

### Hints

There are currently 10 different hint types available:
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

There are a few rules regarding how these hint types work that should be kept in mind:
  - There are always 5 hint types available per song.
  - Out of the 10 hint types, 4 different ones are randomly selected for each song at the start of the game.
    This means that every time you restart the game, you will get a different set of hint types for the same song.
    **Important Note:** If needed song data is missing for any hint type, that hint type will not be available for that song and is automatically filtered out. More on that can be found in the [Adding songs section](#adding-songs).
  - The audio hint is always available as the 5th and final hint, so you can always listen to the song if you want to.
  - The hints can be revealed in any order.
  - Only hint type **Reveal letter** or **Reveal vowels** can be used to reveal letters in the song title. They will never both be available for the same song.

### Adding Songs

If you want to play, you have to add your own songs after running the [Setup steps](#setup).
This can be done by opening the `code/html/addSongs.html` file in your web browser and filling out the input fields.

These fields are available for every song you want to add:

- **Song Title:**
  - **Required**
  - Content: The title of the song you want to add.
  
- **Artist Name:**
  - **Required**
  - Content: The name of the song's artist.
  - Needed for hint type **Artist name**
  
- **Audio file name:**
  - **Required**
  - Content: The full name of the audio file (with file extension) of the song. 
    The audio file itself must be placed into `/code/public/assets/audio/song_audio`.
    Helpful tip: You can use this website to download any song audio from Spotify: https://spotmate.online/en1
  - Needed for hint type **Audio**
  
- **Release year:**
  - **Required**
  - Content: The year the song was released.
  - Needed for hint type **Release year**
  
- **Genre:**
  - **Required**
  - Content: The genre of the song.
  - Needed for hint type **Genre**

- **Album name:**
  - **Optional**
  - Content: The name of the album the song is from.
  - Needed for hint type **Album name**

- **Video source:**
  - **Optional**
  - Content: The full name of the video file (with file extension) of the song. 
    The video file itself must be placed into `/code/public/assets/video/music_videos`.
    Helpful tip: You can use this website to download any music video from YouTube: https://speedscribe.ai/de/downloader/youtube-video-downloader/
  - Needed for hint type **Music video**

- **Album cover name**
  - **Optional**
  - Content: The full name of the album cover image file (with file extension) of the song. 
    The image file itself must be placed into `/code/public/assets/img/album_covers`.
  - Needed for hint type **Album cover**

- **Player first name:**
  - **Optional**
  - Content: The first name of the person who chose the song.
  - Only add this information if you want to enable player guessing for the song.

- **Player last name:**
  - **Optional**
  - Content: The last name of the person who chose the song.
  - Not needed for any hint type or guessing, this is just to prevent confusion if multiple players have the same first name.

- **Artist image name:**
  - **Optional**
  - Content: The full name of the artist image file (with file extension) of the song. 
    The image file itself must be placed into `/code/public/assets/img/artist_images`.
  - Needed for hint type **Artist image**

You don't have to fill out all fields for every song, only the ones marked as required.
However, keep in mind that the more data you provide, the more hints/features will be available for that song.
Congrats, after adding your songs the game can start! :fireworks:

## Setup

1. Copy `.env.example` to `.env` and fill in your actual credentials:
   - `DB_HOST` - Keep as `mysql` if you are running the game locally with Docker
   - `DB_USERNAME` - Keep as `root` if you are running the game locally with Docker
   - `MYSQL_ROOT_PASSWORD` - The password for your MySQL root user
   - `DB_NAME` - The name of your live database
   - `TEST_DB_NAME` - The name of your test database
   - `USE_TEST_DB` - Toggle usage of the test (`true`) or the live (`false`) database

2. Run these make targets in order:
   - `make install`
   - `make up`

3. Import the default database structure by running `make import-db-backup FILENAME=default.sql PASSWORD={your_database_root_password} DATABASE={your_database_name}`.

4. The Backend-API should now be accessible at `http://localhost:88/`.

5. Add songs by following the instructions in the [Adding Songs](#adding-songs) section.

6. To run the game, simply open the `code/html/index.html` file in your web browser.

## Make Targets

There are different make targets available to install and run this project:
- `make list` - List all available make targets.
- `make build-dev` - Build the Docker images.
- `make up` - Start the containers.
- `make down` - Stop the containers.
- `make install` - Run `make build-dev`, `make create-asset-folders` and install composer dependencies.
- `make create-asset-folders` - Create the necessary asset folders.
- `make update` - Update composer dependencies.
- `make composer-dump` - Reload composer autoload files.
- `make cleanup` - Cleanup all containers, images and volumes.
- `make backup PASSWORD={your_database_root_password} DATABASE={your_database_name}` - Create a backup SQL file (in `docker/mysql/backups`) of the specified database.
- `make import-db-backup FILENAME={filename.sql} PASSWORD={your_database_root_password} DATABASE={your_database_name}` - Import a backup SQL file (contained in `docker/mysql/backups`) into the specified database.
- `make unit-test` - Run the unit tests.