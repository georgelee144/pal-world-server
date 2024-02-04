#!/bin/bash

# Define source directories and base destination directory
PAL_WORLD_SETTINGS="/home/steam/palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini"
SAVED_GAME_DIR="/home/steam/palworld/Pal/Saved/SaveGames/0/"
PAL_WORLD_BACKUP_DIR="/home/YOUR_USERNAME/palworld_backup"

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Create new backup directories for this run
PAL_WORLD_SETTINGS_BACKUP="$PAL_WORLD_BACKUP_DIR/palworld_config_$TIMESTAMP"
SAVED_GAME_BACKUP="$PAL_WORLD_BACKUP_DIR/palworld_savegames_$TIMESTAMP"

mkdir -p "$PAL_WORLD_SETTINGS_BACKUP"
mkdir -p "$SAVED_GAME_BACKUP"

# Copy files with rsync
rsync -av "$PAL_WORLD_SETTINGS" "$PAL_WORLD_SETTINGS_BACKUP/"
rsync -av "$SAVED_GAME_DIR" "$SAVED_GAME_BACKUP/"

# Function to delete oldest backups if more than 7 exist
function delete_oldest_backup {
    local backup_base_path=$1
    local max_backups=7

    # Create an array of backup directories sorted by date (newest to oldest)
    local backups=($(ls -1d $backup_base_path* | sort -r))

    # Keep only the newest $max_backups directories
    local count=${#backups[@]}
    if [ $count -gt $max_backups ]; then
        local backups_to_delete=(${backups[@]:$max_backups})
        for backup in "${backups_to_delete[@]}"; do
            rm -rf "$backup"
        done
    fi
}

# Apply the backup deletion to each type of backup
delete_oldest_backup "$PAL_WORLD_BACKUP_DIR/palworld_config"
delete_oldest_backup "$PAL_WORLD_BACKUP_DIR/palworld_savegames"

echo "Backup completed on $(date)"