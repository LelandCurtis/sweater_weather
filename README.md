# Sweater Weather: A Turing 2110 BE Mod 3 Project

## Background & Description:
"Sweater Weather" is an individual project that focusses on consuming and creating API endpoints. It combines freely-available weather, location, image, and travel-directions data to serve up information about the weather at queried destinations.

## Features:
- Consume several external APIs
- Repackage data into new API endpoints
- Allow user registration and login

## API Endpoints
### Retrieve weather for a city: `GET /api/v1/forecast?location=denver,co`
#### Example Response:
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```

### Retrieve Background Image for the City: `GET /api/v1/backgrounds?location=denver,co`
#### Example Response:
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "height": 4160,
                "width": 6240,
                "location": "Denver",
                "image_url": "https://www.pexels.com/photo/union-station-building-2706750/",
                "author": "Thomas Ward"
            }
        }
    }
}
```

### User Registration: `POST /api/v1/users`
```
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
#### Example Response:
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### User Login: `POST /api/v1/sessions`
```
{
  "email": "whatever@example.com",
  "password": "password"
}
```
#### Example Response:
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Retrieve Weather at Roadtrip Destination: `POST /api/v1/road_trip`
```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
#### Example Response:
```
{
   "data": {
      "id": null,
      "type": "roadtrip",
      "attributes": {
         "start_city": "Denver, CO",
         "end_city": "Port Matilda, PA",
         "travel_time": "22 hours, 39 minutes",
         "weather_at_eta": {
            "temperature": 35.85,
            "conditions": "overcast clouds"
         }        
      }
   }
}
```

## Requirements and Setup (for Mac):
### Ruby and Rails
- Ruby -V 2.7.2
- Rails -V 5.2.6

### Gems Utilized
#### Development/Testing Environments
- rspec-rails
- pry
- simplecov
- factory_bot_rails
- faker
- jsonapi-serializer
- figaro
- shoulda-matchers
- webmock
- vcr
- faker
- factory_bot

#### Production Environment
- bootstrap
- faraday
- pexels
- jsonapi-serializer

### Setup
1. Fork and/or Clone this Repo from GitHub.
2. In your terminal use `$ git clone <ssh or https path>`
3. Change into the cloned directory using `$ cd sweater_weather`
4. Install the gem packages using `$ bundle install`
5. Sign up for an Open Weather Map API key: [Open Weather Map](https://openweathermap.org/api)
6. Sign up for a Mapquest API key: [MapQuest](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)
7. Sign up for a Pexels API key: [Pexels](https://www.pexels.com/api/)
8. Add API keys to your ENV using the `config/application.yml` file as shown below:
   ```
    open_weather_api_key: <your api key here>
    map_quest_api_key: <your api key here>
    pexels_api_key: <your api key here>
   ```
9. Startup and Access require the server to be running locally and a web browser opened.
  - Start Server
```shell
$ rails s
```
 - Open Web Broswer and visit http://localhost:3000/
   - Please visit below endpoints to see JSON data being exposed

### Testing
 - Test using the terminal utilizing RSpec
 ```shell
 $ rspec spec/<follow directory path to test specific files>
 ```
   or test the whole suite with `$ rspec`


## Further Project Information
 - [Turing Project Details](https://backend.turing.edu/module3/projects/sweater_weather/requirements)


