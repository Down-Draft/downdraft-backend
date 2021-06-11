![Title](lib/images/downdraft_title_helvetica_neue_condensedblack.jpg)


## About
DownDraft is an application in which users can get beer recommendations based on the forecast (temperature) and elevation of a planned outing.

## Table of contents
[**About**](#about) |
[**Versions**](#versions) |
[**Setup**](#setup) |
[**Endpoints**](#endpoints) |
[**Examples**](#examples) |
[**Tests**](#running-the-tests) |
[**Deployment**](#deployment) |
[**Developers**](#developers) |
[**Acknowledgements**](#acknowledgements) 

## Getting Started
Visit us on [Heroku](https://downdraft-backend.herokuapp.com/) or on [Local Host 3000](http://localhost:3000/) to get started with the steps below.

## Versions
* Ruby 2.5.3
* Rails 5.2.5

## Setup
If you are running this API locally, follow the steps below:
  1. Fork and clone this repo
  2. Install gem packages by running `bundle`
  3. Setup the database: `rails db:(drop,create,migrate,seed)` or `rails db:setup`
  4. Run command `rails s` and navigate to http://localhost:3000 to consume API endpoints below

If you are running the API via [Heroku](https://downdraft-backend.herokuapp.com/), simply consume endpoints below.

## Endpoints
The following are all API endpoints. Note, some endpoints have optional or required query parameters.
- All endpoints run off base connector http://localhost:3000 on local or https://downdraft-backend.herokuapp.com/ on Heroku

### Trips:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/trips`                             | Retrieve all trips  for a logged in user.                      |
| `GET`   | `/api/v1/trips/<trip_id>`                             | Retrieve a single trip.                       |
| `POST`    | `/api/v1/trips`                          | Create a trip. beer.                       |
| `DELETE` | `/api/v1/trips/<trip_id>` | Delete a trip. |


### Beers:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/beers`                             | Retrieve all beers.                      |
| `GET`   | `/api/v1/beers/search?name=<beer_name>`                             | Retrieve all beers with a given name fragment.                       |
| `GET`    | `single beer id?`                          | Retrieve single beer.                       |

### Forecast:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/1-day-forecast?location=<location>`                             | Retrieve a one day forecast for a given location.                      |
| `GET`   | `/api/v1/3-day-forecast?location=<location>`                             | Retrieve a three day forecast for a given location.                       |

### Elevation:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/elevation?location=<location>`                             | Retrieves elevation for a given location.                      |

## Examples

### A single day forecast for Denver, Colorado:

```
{
  "data": {
    "id": "70161319870140",
    "type": "forecast",
    "attributes": {
      "location_name": "Denver",
      "location_state": "Colorado",
      "date": "2021-06-09",
      "max_temp": 89.4,
      "min_temp": 67.8,
      "description": "Partly cloudy",
      "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
    }
  }
}
```

### The elevation in Denver, Colorado:

```
{
  "data": {
    "id": "70161284282460",
    "type": "elevation",
    "attributes": {
      "elevation": 5354.3308799999995
    }
  }
}

```

## Running the Tests

Run all tests in application with `bundle exec rspec`. When test is complete, run `open coverage` to see where tests are being run and where they are not.


## Deployment

- To run this app locally, run `rails s` and navigate to `http://localhost:3000/` in your browser.
- To run this app on Heroku, go to https://downdraft-backend.herokuapp.com/

## Built Using
- Ruby on Rails

## Developers
* Logan Anderson [GitHub](https://github.com/loganjacob76) • [LinkedIn](https://www.linkedin.com/in/logan-anderson-01b49920a/)
* Gaelyn Cooper [GitHub](https://github.com/gaelyn) • [LinkedIn](https://www.linkedin.com/in/gaelyn-cooper/)
* Joey Haas [GitHub](https://github.com/joeyh92989) • [LinkedIn](https://www.linkedin.com/in/haasjoseph/)
* Joe Mecha [GitHub](https://github.com/joemecha) • [LinkedIn](https://www.linkedin.com/in/joemecha/)
* Klaudia Stewart [GitHub](https://github.com/klaudiastewart) • [LinkedIn](https://www.linkedin.com/in/klaudia-stewart/)

~ feel free to contact us ~

<!-- ![Screenshot](lib/images/ADD-A-SCREENSHOT) -->

## Acknowledgments

Thank you to Weather and Open Top Data for allowing us to use your API's. Also, thanks to Open Beer db for your CSV database. We'd like to thank Turing School of Software and Engineering for helping me come up with the idea for this application, and thank you for reading through this project!
