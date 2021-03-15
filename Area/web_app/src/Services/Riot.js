import React, {useState} from "react";

import '../style.css';

function Riot() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Riot";
    var serviceAction= "RiotGame";
    var action= "action1";
    var actionInfo= "1";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var username;

    var [count8, setCount8] = useState(0);
    
    async function getInput() {
        username = document.getElementById('username').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("username:" + username + " reaction:" + reactionInfo);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + username,
                "actionService": serviceAction,
                "actioninfo": username,
                "action": action,
                "reaction": reaction + count8,
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
                        setCount8(count8 = document.getElementById('selector8').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Riot</h2>
                <p>When a player become first of the ladder (LOL)</p>
                <input id="username" class="entry2" type="text" placeholder="Username"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector8">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Riot;