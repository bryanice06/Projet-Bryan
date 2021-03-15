import React, {useState} from "react";

import '../style.css';

function Riot2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Riot";
    var serviceAction= "RiotGame";
    var action= "action2";
    var actionInfo= "2";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var username1;

    var [count9, setCount9] = useState(0);
    
    async function getInput() {
        username1 = document.getElementById('username1').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("username1:" + username1 + " reaction:" + reactionInfo);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + username1,
                "actionService": serviceAction,
                "actioninfo": username1,
                "action": action,
                "reaction": reaction + count9,
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
                        setCount9(count9 = document.getElementById('selector9').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Riot</h2>
                <p>When a player become first of the ladder (TFT)</p>
                <input id="username1" class="entry2" type="text" placeholder="Username"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector9">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Riot2;