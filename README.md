# README


## DESCRIPTION:
Are you ready for the most exciting API endpoint that you have ever seen? Ok, well then maybe this might not be the endpoint for you. However, if you are looking for a solid endpoint, which is well tested and designed, AND which provides useful data about Bike Thefts and Hazards in your `zipcode`, then you are in the right place!

This project was a code challenge, which was scoped to a time limit. As such, there is plenty of room for growth and improvement, and this code was built with the intent of iterating further if desired. Please see the **INSIGHTS AND THOUGHTS** section at the bottom of this README for additional insights and thoughts.

A simplified version of the prompt was to consume a Third Party API, process data from that API, and present it in some manner to users via our own API. The Third Party API for this project was **BikeWise**, and their documentation can be found [here](https://www.bikewise.org/documentation/api_v2#!/). _Specifically we are using their `GET /api/v2/incidents` endpoint_.

#### Areas of Emphasis:
- Creating a functional API endpoint which meet the acceptance criteria of the challenge.
- Test Driven Development.
- Providing thorough test case scenarios.
- Following good MVC principles.
- Demonstrating proper git workflow practices - _clean and logical commit history, squashing when necessary_.
- Providing good documentation for those who take a look at this project.

*****

## API ENDPOINT:
This API endpoint is currently deployed on Heroku, and can be found at the base url:  
 **https://sad-bikes.herokuapp.com/api/v1/incidents**

### GET /api/v1/incidents

##### Required Parameters:
`:zipcode`  
`>` Must be a valid 5 digit zip code.  
`>` [Here](https://www.zipcodestogo.com/Colorado/) is a sample list of Colorado zip codes.

##### Optional Parameters:
`:sort_date_by`  
`>` Must be either 'desc' or 'asc'.   
`>` Sorts response data from newest to oldest, or vice versa.  
`>` Ordering defaults to newest to oldest ('desc') if this param is not passed in.


`:type`  
`>` Must be either 'hazard' or 'theft'.  
`>` Filters incidents by their categorized type.  
`>` Incidents of all types are returned if this param is not passed in.  
`>` Note: Incidents can be categorized as additional types in response data (ex: 'Crash'), however 'Hazard' and 'Theft' are the only filtering options at this time.

##### Examples:
```
Params :zipcode

Request:
https://sad-bikes.herokuapp.com/api/v1/incidents?zipcode=80104

Response:
{
    "incidents": [
        {
            "id": 52181,
            "type": "Theft",
            "title": "Stolen 2015 Giant Talon M3(black, red, and white)",
            "description": "Stolen from garage",
            "address": "Castle Rock, CO, 80104",
            "occurred_at": 1445752800,
            "date_and_time": "10-25-2015 06:00",
            "url": "https://bikewise.org/api/v1/incidents/52181",
            "image_url": "https://files.bikeindex.org/uploads/Pu/38403/large_2015_Giant_Talon_C64L7979.jpg"
        },
        {
            "id": 34720,
            "type": "Theft",
            "title": "Stolen 2012 Trek Rumblefish Pro(brown, green, and white)",
            "description": "Workplace",
            "address": "Castle Rock, CO, 80104",
            "occurred_at": 1336197600,
            "date_and_time": "05-05-2012 06:00",
            "url": "https://bikewise.org/api/v1/incidents/34720",
            "image_url": "https://bikebook.s3.amazonaws.com/uploads/Fr/729/23372"
        }
    ]
}
```

```
Params :zipcode, :sort_date_by

Request:
https://sad-bikes.herokuapp.com/api/v1/incidents?zipcode=80104&sort_date_by=asc

Response:
{
    "incidents": [
        {
            "id": 34720,
            "type": "Theft",
            "title": "Stolen 2012 Trek Rumblefish Pro(brown, green, and white)",
            "description": "Workplace",
            "address": "Castle Rock, CO, 80104",
            "occurred_at": 1336197600,
            "date_and_time": "05-05-2012 06:00",
            "url": "https://bikewise.org/api/v1/incidents/34720",
            "image_url": "https://bikebook.s3.amazonaws.com/uploads/Fr/729/23372"
        },
        {
            "id": 52181,
            "type": "Theft",
            "title": "Stolen 2015 Giant Talon M3(black, red, and white)",
            "description": "Stolen from garage",
            "address": "Castle Rock, CO, 80104",
            "occurred_at": 1445752800,
            "date_and_time": "10-25-2015 06:00",
            "url": "https://bikewise.org/api/v1/incidents/52181",
            "image_url": "https://files.bikeindex.org/uploads/Pu/38403/large_2015_Giant_Talon_C64L7979.jpg"
        }
    ]
}
```

```
Params :zipcode, :type

Request:
https://sad-bikes.herokuapp.com/api/v1/incidents?zipcode=80402&type=hazard

Response:
{
    "incidents": [
        {
            "id": 77993,
            "type": "Hazard",
            "title": "Bike trail needs sign",
            "description": "Needs to be a sign warning bikers of traffic",
            "address": "100 Jefferson County Pkwy Golden, CO 80419, USA",
            "occurred_at": 1505313023,
            "date_and_time": "09-13-2017 14:30",
            "url": "https://bikewise.org/api/v1/incidents/77993",
            "image_url": "https://seeclickfix.com/files/issue_images/0087/1991/1505312921145.jpg"
        },
        {
            "id": 41588,
            "type": "Hazard",
            "title": "The bike lane is not marked as ending as you approach 24th St. The lane needs to be dashed instea...",
            "description": "The bike lane is not marked as ending as you approach 24th St. The lane needs to be dashed instead of solid near the intersection and a sign indicate the lane ends is needed. This indicates to those unfamiliar with the area they need to merge left with traffic.",
            "address": "2300-2398 Jackson St, Golden, CO 80401, USA",
            "occurred_at": 1286465480,
            "date_and_time": "10-07-2010 15:31",
            "url": "https://bikewise.org/api/v1/incidents/41588",
            "image_url": null
        },
        {
            "id": 41587,
            "type": "Hazard",
            "title": "The light when heading northbound into campus will not trigger for a bicycle. Heading southbound,...",
            "description": "The light when heading northbound into campus will not trigger for a bicycle. Heading southbound, leaving campus, it will trigger if I place the bicycle right over the middle line in the sensor loop.",
            "address": "1901-1947 Illinois St, Golden, CO 80401, USA",
            "occurred_at": 1286465311,
            "date_and_time": "10-07-2010 15:28",
            "url": "https://bikewise.org/api/v1/incidents/41587",
            "image_url": null
        }
    ]
}
```

*****

## SETUP:

#### Important Versions:
- Ruby 2.7.2
- Rails 6.1.3
- Bundler 2.2.1

#### Clone Repo and Bundle Gems:
From your terminal, navigate to the directory that you would like to clone this project into. Once there, run one of the following commands:
```
Using SSH:
$ git clone git@github.com:CSheesley/sad_bikes.git

Using HTTPS:
$ git clone https://github.com/CSheesley/sad_bikes.git
```
From the command line, navigate to be inside the project directory.  
`$ cd sad_bikes`

Once there, run the following command, which will install our GEM libraries and dependencies.  
`$ bundle install`

#### Database
Run the following commands to create and setup your local database:  
`$ rake db:create`  
`$ rake db:schema:load`  

#### Running Locally
If you would like to hit our end point locally at `http://localhost:3000/api/v1/incidents`, you will need to start a local server by running:  
`$ rails server`
*****

## TESTING:
We are using **RSpec** for our test suite. In order to run that suite, run the following command:  
`$ bundle exec rspec`

To see what our test coverage looks like (courtesy of SimpleCov), you can run the following command, which will open an html page with details.  
`$ open coverave/index.html`

*****

## INSIGHTS AND THOUGHTS:

### Insights:
- I chose to handle the 'uniqueness' of a Search based upon its `:zipcode` and its `:created_at` date. A new Search object is created if:  
1) There is no corresponding Search object with the same `:zipcode`  
2) There is a corresponding Search object with the same `:zipcode`, however that object was `:created_at` more than 48 hours ago

- Search objects hold a JSON response from BikeWise in its `:response_json` attribute, which we can reference, rather than making another call to BikeWise. _This is essentially some baked in caching._ To keep the database clean, we could potentially enlist the services of a JOB to go through and clean out 'old' records if we wanted to handle things another way.

- If we were concerned about more in-depth querying of the responses outside of the simple sorting and filtering that we are currently doing with Ruby, we could implement some Active Record. In order to do this, we could create associated `Incident` objects upon the creation of a `Search` object, however I wonder if this is a viable approach, or are we just copying an existing database managed by BikeWise.

- I made sure to follow good commit practices by frequently committing logical chunks of work. All work however was done on the projects `main` branch. This was done intentionally to keep the workflow simpler due to this being a code challenge. If this were on a real project, each feature would have had its own `feature_branch` where work would have taken place, prior to opening Merge Requests.

### Some things I would do with more time:
- Stub out `Faraday` requests, to avoid making actual calls when running our tests. _The way it currently stands, tests could break if new data is added to the BikeWise database_.
- Try to reference sample JSON payloads in Search Factory a cleaner way than hardcoding it in the factory itself.
- Expand the params that I receive from users, and pass onto BikeWise. _For example, while the majority of 'incident' types are 'Hazard' or 'Theft', you will occasionally come across types such as 'Crash'_. This would be be an easy addition to implement if desired.
- Add endpoints for an 'Admin' in case they wanted to access and interact with Search objects via an API. ( _/admin/api/v1/searches_ )
- Currently almost all of the functional testing logic lives in the `get_incidents_request_spec.rb` file, which does act as integration testing for the `BikeWiseService`, `IncidentsSearchFilter` and `IncidentsSerializer`. Ideally these objects would some testing done at the unit level.
- Explicitly test handling a 500 response from BikeWise - although this has been addressed and tested manually, a more thorough approach could likely be taken.
