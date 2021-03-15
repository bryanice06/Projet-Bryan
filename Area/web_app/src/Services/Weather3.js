import React, {useState} from "react";

import '../style.css';

function Weather() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];
    var name= "Weather";
    var serviceAction= "Weather";
    var action= "action3";
    var actionInfo= "3";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var city4;
    var degres2;

    var [count12, setCount12] = useState(0);

    async function getInput() {
        city4 = document.getElementById('city4').value;
        degres2 = document.getElementById('degres2').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("city4:" + city4 + " degres2:" + degres2 + " reaction:" + count12);
        console.log(name + city4 + degres2);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + city4 + degres2,
                "actionService": serviceAction,
                "actioninfo": city4 + "/" + degres2,
                "action": action,
                "reaction": reaction + count12,
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
                        setCount12(count12 = document.getElementById('selector12').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Weather</h2>
                <p>When a city above a temperature</p>
                <input id="city4" class="entry2" type="text" placeholder="City"/>
                <input id="degres2" class="entry2" type="text" placeholder="Degres"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector12">
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