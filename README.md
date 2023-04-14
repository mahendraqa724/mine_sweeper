# Mine Sweeper initial Board
Objective of this project is to create initial board for Mine Sweeper game. Where we can 

## Ruby version:
ruby-3.0.0

## System dependencies
install sqlite3 and libsqlite3-dev
```bash
sudo apt-get install sqlite3 libsqlite3-dev
```

## Configuration
run bundle install
```bash
bundle install
```
## Database creation
create database and import seeds file 
```bash
rails db:create
rails db:seed
```
## Additional precaution
keep board width less than 32 to see whole or make sure more than 30% of cells are filled (for large width size)
To keep site responsive I have kept validation of width less than 100.