# Rails, Redis, & Postgres Case Study

Follow this course to see how Redis and Postgres can work together for high performance custom application development.

## Goals

Learn how Redis can help your relational database driven application performance.

## Setup the application demo

For this example we will be using Rails, Postgres, and Redis. Please follow the installation guide below.

1. [Install Homebrew](http://brew.sh/)

2. [Rails on El Capitan](https://gorails.com/setup/osx/10.11-el-capitan). We will be using Postgres, so you don't need to install MySQL in this guide.

3. Follow the Homebrew Postgres instructions in the above guide to install with or download the Postgres app for MAC [here](http://postgresapp.com/). I find the Postgres app to be very useful.

4. Install Redis with Homebrew with `$ brew install redis`. Then follow the prompt to start the server. Run the following:

```bash
$ redis-cli
redis 127.0.0.1:6379> ping
PONG
redis 127.0.0.1:6379> set mykey somevalue
OK
redis 127.0.0.1:6379> get mykey
"somevalue"
```

5. Clone this application and `cd` into the application directory.

6. Download the example DB [here](http://bwcompsci.s3.amazonaws.com/presentations/clickbait_dev.tar)

6. From the application root run `bundle install`

7. Run `$ rake db:create`

8. Restore the database with `$ pg_restore -d clickbait_development clickbait_dev.tar`

9. Run `$ rake db:migrate` and start the console with `$ rails console`

10. In console you should see the following:

```ruby
➜  redis-course git:(master) rails c
Running via Spring preloader in process 68649
Loading development environment (Rails 4.2.5.1)
irb(main):001:0> ScoreCard.count
   (49.9ms)  SELECT COUNT(*) FROM "score_cards"
=> 365000
```


### Coming soon

An example application for the Express framework.


### Links/Resources

- Postgres
[Postgres Documentation](http://www.postgresql.org/docs/9.5/interactive/index.html)
[Postgres for MAC app](http://postgresapp.com/)

- Rails
[http://rubyonrails.org/](http://rubyonrails.org/)
[https://github.com/RailsApps/rails-composer](https://github.com/RailsApps/rails-composer)

- Redis
[Redis](http://redis.io/)
[Quickstart guide](http://redis.io/topics/quickstart)
