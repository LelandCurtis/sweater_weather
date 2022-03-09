# Sweater Weather

# MarketMap: A Turing 2110 BE Mod 3 Consultancy Project

![languages](https://img.shields.io/github/languages/top/Turing-MarketMap/market-map-fe?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/Turing-MarketMap/market-map-fe)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-6-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->



## Background & Description:
"MarketMap" is a group project built over the course of 10 days in Turing's module 3 backend program. This project is a branch of Turing's Consultancy project. We pitched a rough concept of creating an application that would let a user search for cars listings and enable them to know if they were getting a good deal based other listings across the United States. See below for more details on the backend features.

## Features:
- Consuption of Google Image API to find images for the listings
- Consume the endpoints exposed by the MarketMap backend
- Integrate a chart with user/friendly features
- Implement Circle CI
- Implement OAuth using OmniAuth to sign in with Google
- Build a project with Service Oriented Architecture (SOA)


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

## Testing
 - Test using the terminal utilizing RSpec
 ```shell
 $ rspec spec/<follow directory path to test specific files>
 ```
   or test the whole suite with `$ rspec`


## External API Endpoint


## Further Project Information
 - [Turing Project Details](https://backend.turing.edu/module3/projects/sweater_weather/requirements)


