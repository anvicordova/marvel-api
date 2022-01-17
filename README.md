## Dependencies
Ruby 2.6.3
Marvel API keys
  1. Create a Marvel Account in [http://developer.marvel.com/docs]
  2. Get your key at https://developer.marvel.com/account


## Development setup

### With Docker

1. Copy environment variables

```
  cp .env.example .env
```

2. Add your private and public keys to the `.env` file

3. Run `docker-compose up`

4. In your browser, go to `http://localhost:4567`

### Full setup

1. `cp .env.example .env`
2.  Add your public and private keys in the `.env` file
3. `gem install bundler`
4. `bundle install`
5. In your terminal run `rerun 'rackup -p  4567'`
5. In your browser, go to `http://localhost:4567`

## Testing
1. In your terminal run `rspec` in the main folder.
