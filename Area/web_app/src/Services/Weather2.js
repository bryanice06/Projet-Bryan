import React, {useState} from "react";

import '../style.css';

function Weather2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];
    var name= "Weather";
    var serviceAction= "Weather";
    var action= "action2";
    var actionInfo= "2";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var city6;
    var temps;

    var [count11, setCount11] = useState(0);

    async function getInput() {
        city6 = document.getElementById('city6').value;
        temps = document.getElementById('temps').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("city:" + city6 + " temps:" + temps + " reaction:" + count11);
        console.log(name + city6 + temps);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + city6 + temps,
                "actionService": serviceAction,
                "actioninfo": city6 + "/" + temps,
                "action": action,
                "reaction": reaction + count11,
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
                        setCount11(count11 = document.getElementById('selector11').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Weather</h2>
                <p>When weather of a chosen city</p>
                <input id="city6" class="entry2" type="text" placeholder="City"/>
                <input id="temps" class="entry2" type="text" placeholder="rain, cloud or clear"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector11">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Weather2;