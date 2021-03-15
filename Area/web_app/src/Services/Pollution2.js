import React, {useState} from "react";

import '../style.css';

function Pollution2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Pollution";
    var serviceAction= "Pollution";
    var action= "action1";
    var actionInfo= "1";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var city3;
    var aqi;

    var [count6, setCount6] = useState(0);

    async function getInput() {
        city3 = document.getElementById('city3').value;
        aqi = document.getElementById('aqi').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("city3:" + city3 + " aqi:" + aqi + " reaction:" + reactionInfo);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + city3 + aqi,
                "actionService": serviceAction,
                "actioninfo": city3 + "/" + aqi,
                "action": action,
                "reaction": reaction + count6,
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
                        setCount6(count6 = document.getElementById('selector6').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Pollution</h2>
                <p>When a city exceeds a pollution rate</p>
                <input id="city3" class="entry2" type="text" placeholder="City"/>
                <input id="aqi" class="entry2" type="text" placeholder="AQI"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector6">
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