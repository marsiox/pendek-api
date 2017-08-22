# README

This is a Rails 5 API demonstration app for shortening urls and serving basic stats around them. JSON output is generated with [active_model_serializers](https://github.com/rails-api/active_model_serializers) gem.

## Requirements
* Ruby  v. 2.4.1
* PostgreSQL

## Installation
```
cp config/database.yml.sample config/database.yml
cp config/secrets.yml.sample config/secrets.yml
bundle
rails db:create
rails db:migrate
```
Run `rails db:seed` to populate the DB with sample data.

## Configuration
Edit `config/application.rb` to change set your host url and short url length:
```ruby
# Custom configuration
config.x.short_url_length = 6
config.x.app_base_url = "http://pndk.id:3000/"
```
## Tests
`bundle exec rspec`

## API endpoints

### 1. POST create URL `http://localhost:3000/api/urls`

Expected only valid URL

Post params:
```javascript
{
  "data": {
    "full": "http://www.longtimeagoinagalaxyfaraway.com/"
  }
}
```

Response:
```javascript
{
  "data": {
    "id": "vGwd2u",
    "type": "url",
    "attributes": {
      "full_url": "http://www.longtimeagoinagalaxyfaraway.com/",
      "short_url": "http://pndk.id:3000/vGwd2u"
    }
  }
}
```

### 2. GET URLs `http://localhost:3000/api/urls`

Response:
```javascript
{
  "data": [{
      "id": "vGwd2u",
      "type": "url",
      "attributes": {
        "full_url": "http://www.wp.pl/",
        "short_url": "http://pndk.id:3000/vGwd2u"
      }
    }... ]
}
```

### 3. GET URL stats `http://localhost:3000/api/urls/[URL_SHORT_CODE]`

Response:
```javascript

  "data": {
    "id": "3WUN2s",
    "type": "stats",
    "attributes": {
      "full_url": "http://www.bangkokpost.com/news/world/131046...",
      "stats": {
        "all_visits": 1,
        "by_http_referer": [
          {
            "http_referer": "http://referer/",
            "visits": 1
          }
        ],
        "last_visits": [
          {
            "id": 110,
            "url_id": 1,
            "ip_address": "127.0.0.1",
            "http_referer": "http://referer/",
            "user_agent": "Mozilla/5.0...",
            "created_at": "2017-08-21T11:14:28.942Z"
          }
        ]
      }
    }
  }
}
```
