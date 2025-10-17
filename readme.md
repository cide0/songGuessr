# SongGuessr

SongGuessr is a fun web app that challenges you to guess the title of a song based on a variety of hints.

## Documentation

### Setup

To set up the project, follow these steps:
1. Use the make target `install`.
2. Use the make target `up` to start the backend API.
3. Decide whether to use the live or test database by changing the `USE_TEST_DB` constant in `Configuration.php` to `false` for live or `true` for test.
4. The API should now be accessible at `http://localhost:88/`.
5. To run the game, simply open the `index.html` file in your web browser.

### Database Backups

To create a database backup, use the make target `backup`. The backup will be saved as a SQL file in the `docker/mysql/backups/` folder.

To load a database backup, use the make target `import-db-backup FILENAME={filename_of_backup}`.

To load a database backup for testing purposes, use the make target `reset-test-db FILENAME={filename_of_backup}`.

The SQL file should be located in the `docker/mysql/backups/` folder.
