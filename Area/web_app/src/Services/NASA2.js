import React, {useState} from "react";

import '../style.css';

function NASA2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "NASA";
    var serviceAction= "Nasa";
    var action= "action2";
    var actionInfo= "2";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";

    var [count13, setCount13] = useState(0);

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
                "reaction": reaction + count13,
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
                        setCount13(count13 = document.getElementById('selector13').value);
                        getCreateData();
                    }} class="add_area">Add</button>
                </div>
                <h2>NASA</h2>
                <p>When a meteroite passing close to earth</p>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector13">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default NASA2;