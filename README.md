# DEPENDENCIES
Ruby 2.6.3

# DEVELOPMENT SETUP
1. Create a Marvel Account in [http://developer.marvel.com/docs]
2. Get your key at https://developer.marvel.com/account
3. `cp .env.example .env`
4.  Add your public and private keys in the `.env` file
5. `gem install bundler`
6. `bundle install`
7. In your terminal run `rerun 'rackup -p  4567'`
8. In your browser, go to `http://localhost:4567`

You can click in each of the names of the characters displayed to get a whole
new page or refresh the current one to get a new story and their characters.

You can also use the URL to find new stuff ex: `http://localhost:4567/?name=Banshee`

# TESTING
1. In your terminal run `rspec` in the main folder.
