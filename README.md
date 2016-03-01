# Rails, Redis, & Postgres Case Study

## Goals

Learn how Redis can help improve performance of your relational database driven application.

## Setup the application demo

This example uses Rails, Postgres, and Redis. Please follow the installation guide below. Setup takes 10 to 30 minutes depending on experience with the technologies.

1. [Install Homebrew](http://brew.sh/)

2. [Rails on El Capitan](https://gorails.com/setup/osx/10.11-el-capitan). We will be using Postgres, so you don't need to install MySQL in this guide.

3. Follow the Homebrew Postgres instructions in the above guide to install with or download the Postgres app for MAC [here](http://postgresapp.com/). I find the Postgres app to be very useful.

4. Install Redis with Homebrew with `$ brew install redis`. Then follow the prompt to start the server. Run the following to confirm things are working:

```bash
$ redis-cli
redis 127.0.0.1:6379> ping
PONG
redis 127.0.0.1:6379> set mykey somevalue
OK
redis 127.0.0.1:6379> get mykey
"somevalue"
```

5. Clone this application and `cd` into the app directory.

6. From the application root run `bundle install`

7. Download the example DB [here](http://bwcompsci.s3.amazonaws.com/presentations/clickbait_dev.tar)

8. Create the 'clickbait_development' database with psql or rake.

To create the database with psql:

```bash
➜  redis-course git:(master) ✗ psql
psql (9.4.0)
Type "help" for help.

BrettU=# create database clickbait_development;
CREATE DATABASE
```

OR with rake and Rails

`$ rake db:create`

9. Restore the database with `$ pg_restore -d clickbait_development clickbait_dev.tar`

10. Run `$ rake db:migrate` and start the console with `$ rails console`

11. In console query to confirm  365000 score cards have been created.

```bash
$ rails c
irb(main):001:0> ScoreCard.count
   (49.9ms)  SELECT COUNT(*) FROM "score_cards"
=> 365000
```

12. Test redis in rails console:

```
$ rails c
irb(main):001:0> $redis.ping
=> "PONG"
irb(main):002:0>
```

Issues? Google the exception message or open a issue in this repo.


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
[Redis config](https://raw.githubusercontent.com/antirez/redis/3.0/redis.conf)
