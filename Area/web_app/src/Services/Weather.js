import React, {useState} from "react";

import '../style.css';

function Weather() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];
    var name= "Weather";
    var serviceAction= "Weather";
    var action= "action1";
    var actionInfo= "1";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var city;
    var degres;

    var [count10, setCount10] = useState(0);

    async function getInput() {
        city = document.getElementById('city').value;
        degres = document.getElementById('degres').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("city:" + city + " degres:" + degres + " reaction:" + count10);
        console.log(name + city + degres);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + city + degres,
                "actionService": serviceAction,
                "actioninfo": city + "/" + degres,
                "action": action,
                "reaction": reaction + count10,
                "reactionService": serviceReaction,
                "reactioninfo": reactionInfo
            })
        })
        .then(response => response.json())
        .then((response) => {
            console.log("Server said: " + response);
        });
    }

    return (
        <div>
            <div className="area">
                <div class="wrapbtn">
                    <button onClick={() => {
                        setCount10(count10 = document.getElementById('selector10').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Weather</h2>
                <p>When city below a temperature</p>
                <input id="city" class="entry2" type="text" placeholder="City"/>
                <input id="degres" class="entry2" type="text" placeholder="Degres"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector10">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Weather;