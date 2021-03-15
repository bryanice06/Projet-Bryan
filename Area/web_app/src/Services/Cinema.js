import React, {useState} from "react";

import '../style.css';

function Cinema() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Cinema";
    var serviceAction= "Cinema";
    var action= "action1";
    var actionInfo= "1";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";

    var [count, setCount] = useState(0);
    
    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name,
                "actionService": serviceAction,
                "actioninfo": actionInfo,
                "action": action,
                "reaction": reaction + count,
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
                        setCount(count = document.getElementById('selector').value);
                        getCreateData();
                    }} class="add_area">Add</button>
                </div>
                <h2>Cinema</h2>
                <p>When a movie comes out</p>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Cinema;