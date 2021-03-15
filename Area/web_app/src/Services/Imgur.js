import React, {useState} from "react";

import '../style.css';

function Imgur() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Imgur";
    var serviceAction= "Imgur";
    var action= "action1";
    var actionInfo= "1";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var views;

    var [count3, setCount3] = useState(0);

    async function getInput() {
        views = document.getElementById('views').value;
        displayParams();
        getCreateData();
    }
    
    async function displayParams() {
        console.log("views:" + views + " reaction:" + count3 + " token:" + reactionInfo);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name,
                "actionService": serviceAction,
                "actioninfo": reactionInfo + "/" + views,
                "action": action,
                "reaction": reaction + count3,
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
                        setCount3(count3 = document.getElementById('selector3').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Imgur</h2>
                <p>When a photo exceeds a certain number of views</p>
                <input id="views" class="entry2" type="text" placeholder="Views"/>
                <b>Reaction: Imgur</b>
                <br></br>
                <div width="200px">
                    <select id="selector3">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
                <a href="https://api.imgur.com/oauth2/authorize?response_type=token&client_id=1e9d0bad8e66dcb">Connect to Imgur</a>
            </div>
        </div>
    );
}

export default Imgur;