### sinatra-items-api

This project is part of a performance test among Sinatra (Ruby), Ruby on Rails, and Go. Here are the Rails and Go projects:

- https://github.com/charliemcelfresh/rails-items-api
- https://github.com/charliemcelfresh/go-items-api

Set up the Rails project first, because it creates, migrates, and seeds the database that all three projects use. See [here](https://github.com/charliemcelfresh/rails-items-api)

Once all three are set up, you can compare their performance by running the Go projects performance testing client. See [here](https://github.com/charliemcelfresh/go-items-api).

#### Run the server

- The database
- Copy .env.SAMPLE to .env
- Set `DB_URL` to the MySQL database URL you created in `rails-items-api`
- Run the server: `rackup -p 4567`
