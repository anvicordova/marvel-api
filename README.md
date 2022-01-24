## Dependencies
Ruby 3.0.0
Marvel API keys
  1. Create a Marvel Account in [http://developer.marvel.com/docs]
  2. Get your key at https://developer.marvel.com/account
 
## Development setup
 
### With Docker
 
1. Copy environment variables(from the root directory)
 
```
  cp .env.example .env
  cp ./react-marvel/.env.example ./react-marvel/.env
```
 
2. Add your private and public keys to the `.env` file
 
3. Run `docker-compose up`
 
4. In your browser, go to `http://localhost:3000`
 
5. Try to look for a Marvel Character. Ex: Storm
 
### Full setup
 
1. `cp .env.example .env`
2. `cp ./react-marvel/.env.example ./react-marvel/.env`
3.  Add your public and private keys in the `.env` file
4. `gem install bundler`
5. `bundle install`
6. In your terminal run `rerun 'rackup -p  4567'`
7. In your browser, go to `http://localhost:4567` to test the API
8. Open another terminal
9. `cd react-marvel`
10. `yarn`
11. `yarn start`
12. In your browser, go to `http://localhost:3000` to test the Client
 
 
## Testing
1. In your terminal run `rspec` in the main folder.
 

RAW Paste Data
## Dependencies
Ruby 2.6.3
Marvel API keys
  1. Create a Marvel Account in [http://developer.marvel.com/docs]
  2. Get your key at https://developer.marvel.com/account


## Development setup

### With Docker

1. Copy environment variables(from the root directory)

```
  cp .env.example .env
  cp ./react-marvel/.env.example ./react-marvel/.env
```

2. Add your private and public keys to the `.env` file

3. Run `docker-compose up`

4. In your browser, go to `http://localhost:3000`

5. Try to look for a Marvel Character. Ex: Storm

### Full setup

1. `cp .env.example .env`
2. `cp ./react-marvel/.env.example ./react-marvel/.env`
3.  Add your public and private keys in the `.env` file
4. `gem install bundler`
5. `bundle install`
6. In your terminal run `rerun 'rackup -p  4567'`
7. In your browser, go to `http://localhost:4567` to test the API
8. Open another terminal
9. `cd react-marvel`
10. `yarn`
11. `yarn start`
12. In your browser, go to `http://localhost:3000` to test the Client


## Testing
1. In your terminal run `rspec` in the main folder.