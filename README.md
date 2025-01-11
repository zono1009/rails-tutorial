# README

```
docker-compose build
docker-compose run --rm web bundle exec rails db:migrate
docker-compose run --rm web bundle exec rails db:seed
docker-compose up
docker-compose run --rm web bundle exec rails test
```