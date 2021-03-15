import React, {Component} from "react";

import './style.css';

function Print() {
return (
    <p>
        "client": \n 
            "host": "http://localhost:8080/" \n
        , \n
        "server": \n
            "services": [ \n
                "name": "weather",
                "actions": [
                    "name": "Action 1",
                    "description": "When city below a temperature",
                    "request": "http://api.openweathermap.org/data/2.5/weather?q= + city + &APPID= + API KEY",
                    "params": [
                        "city": "string",
                        "degres": "int"
                    ]
                ,
                    "name": "Action 2",
                    "description": "When weather of a chosen city",
                    "request": "http://api.openweathermap.org/data/2.5/weather?q= + city + &APPID= + API KEY",
                    "params": [
                        "city": "string",
                        "weather": "string"
                    ]
                
            ]
            ,
                "name": "currency converter",
                "actions": [
                    "name": "Action 1",
                    "description": "When one currency is exceeded by another",
                    "request_one": "https://v6.exchangerate-api.com/v6/ + API KEY + /pair/ USD / + currency_one",
                    "request_two": "https://v6.exchangerate-api.com/v6/ + API KEY + /pair/ USD / + currency_two",
                    "params": [
                        "currency_one": "string",
                        "currency_two": "string"
                    ]
                ,
                    "name": "Action 2",
                    "description": "When a currency exceeds the dollar",
                    "request": "https://v6.exchangerate-api.com/v6/ + API KEY + /pair/ USD / + currency",
                    "params": [
                        "currency": "string"
                    ]
                ]
            ,
                "name": "cinema",
                "actions": [
                    "name": "Action 1",
                    "description": "When a movie comes out",
                    "request": "https://api.themoviedb.org/3/movie/upcoming?api_key= + API KEY",
                    "params": [
                        
                    ]
                ]
            ,
                "name": "pollution",
                "actions": [
                    "name": "Action 1",
                    "description": "When a city exceeds a pollution rate",
                    "request": "https://api.waqi.info/feed/ + city_user + /?token= + TOKEN",
                    "params": [
                        "city": "string",
                        "aqi": "string"
                    ]
                ,
                    "name": "Action 2",
                    "description": "When a city exceeds the pollution rate of another city",
                    "request_one": "https://api.waqi.info/feed/ + city_one + /?token= + TOKEN",
                    "request_two": "https://api.waqi.info/feed/ + city_two + /?token= + TOKEN",
                    "params": [
                        "city_one": "string",
                        "city_two": "string"
                    ]
                ]
            ,
                "name": "imgur",
                "actions": [
                    "name": "Action 1",
                    "description": "When a photo exceeds a certain number of views",
                    "request": "https://api.imgur.com/3/gallery/hot/0?showViral=true&mature=false&album_preview=false",
                    "params": [
                        "token": "string",
                        "nb_view": "int"
                    ]
                ],
                "reactions": [
                    "name": "Reaction 1",
                    "description": "Favorite a random photo",
                    "request_one": "https://api.imgur.com/3/gallery/hot/0?showViral=true&mature=false&album_preview=false",
                    "request_two": "https://api.imgur.com/3/image/ + cover[x] + /favorite + TOEKN",
                    "params": [
                        "token": "string"
                    ]
                ,
                    "name": "Reaction 2",
                    "description": "Like a random photo",
                    "request_one": "https://api.imgur.com/3/gallery/hot/0?showViral=true&mature=false&album_preview=false",
                    "request_two": "https://api.imgur.com/3/gallery/ + id[x] + /vote/up/ + TOKEN",
                    "params": [
                        "token": "string"
                    ]
                ,
                    "name": "Reaction 3",
                    "description": "Dislike a random photo",
                    "request_one": "https://api.imgur.com/3/gallery/hot/0?showViral=true&mature=false&album_preview=false",
                    "request_two": "https://api.imgur.com/3/gallery/ + id[x] + /vote/down/ + TOKEN",
                    "params": [
                        "token": "string"
                    ]
                ]
            ,
                "name": "nasa",
                "actions": [
                    "name": "Action 1",
                    "description": "When a satelite photo is posted",
                    "request": "https://api.nasa.gov/planetary/apod?api_key= + API KEY",
                    "params": [
                    ]
                ]
            ,
                "name": "riotgame",
                "actions": [
                    "name": "Action 1",
                    "description": "When a satelite photo is posted",
                    "request": "https://api.nasa.gov/planetary/apod?api_key= + API KEY",
                    "params": [
                        "pseudo": "string"
                    ]
                ]
        ]
     </p>)
}
export default Print;