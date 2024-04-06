### sinatra-items-api

This project is part of a performance test among Postgrest (PostgreSQL plugin), Sinatra (Ruby), Ruby on Rails, and Go. Here are the Postgrest, Rails and Go projects:

- https://github.com/charliemcelfresh/postgrest-items-api
- https://github.com/charliemcelfresh/rails-items-api
- https://github.com/charliemcelfresh/go-items-api

Set up the Postgrest project first, because it creates, migrates, and seeds the database that all three projects use. See [here](https://github.com/charliemcelfresh/postgrest-items-api)

Once all four projects are set up, you can compare their performance by running the Go projects performance testing client. See [here](https://github.com/charliemcelfresh/go-items-api).

#### Run the server

- Copy .env.SAMPLE to .env
- Set `DB_URL` to the PostgreSQL database URL you created [here](https://github.com/charliemcelfresh/postgrest-items-api)
- Run the server: `rackup -p 4567`
