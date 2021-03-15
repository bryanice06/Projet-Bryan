import React, {useState} from "react";

import '../style.css';

function Pollution() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Pollution";
    var serviceAction= "Pollution";
    var action= "action2";
    var actionInfo= "2";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var city1;
    var city2;

    var [count5, setCount5] = useState(0);

    async function getInput() {
        city1 = document.getElementById('city1').value;
        city2 = document.getElementById('city2').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("city1:" + city1 + " city2:" + city2 + " reaction:" + reactionInfo);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + city1 + city2,
                "actionService": serviceAction,
                "actioninfo": city1 + "/" + city2,
                "action": action,
                "reaction": reaction + count5,
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
                        setCount5(count5 = document.getElementById('selector5').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Pollution</h2>
                <p>When a city exceeds the pollution rate of another city</p>
                <input id="city1" class="entry2" type="text" placeholder="City one"/>
                <input id="city2" class="entry2" type="text" placeholder="City two"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector5">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Pollution;