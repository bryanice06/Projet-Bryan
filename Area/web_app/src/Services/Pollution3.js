import React, {useState} from "react";

import '../style.css';

function Pollution2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Pollution";
    var serviceAction= "Pollution";
    var action= "action3";
    var actionInfo= "3";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var city5;
    var pm10;

    var [count7, setCount7] = useState(0);

    async function getInput() {
        city5 = document.getElementById('city5').value;
        pm10 = document.getElementById('pm10').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("city5:" + city5 + " pm10:" + pm10 + " reaction:" + reactionInfo);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + city5 + pm10,
                "actionService": serviceAction,
                "actioninfo": city5 + "/" + pm10,
                "action": action,
                "reaction": reaction + count7,
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
                        setCount7(count7 = document.getElementById('selector7').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Pollution</h2>
                <p>When a city exceeds a dust rate</p>
                <input id="city5" class="entry2" type="text" placeholder="City"/>
                <input id="pm10" class="entry2" type="text" placeholder="PM10"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector7">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Pollution2;