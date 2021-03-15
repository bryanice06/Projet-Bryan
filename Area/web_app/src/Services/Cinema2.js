import React, {useState} from "react";

import '../style.css';

function Cinema2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Cinema";
    var serviceAction= "Cinema";
    var action= "action2";
    var actionInfo= "2";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";

    var [count14, setCount14] = useState(0);
    var [count15, setCount15] = useState(0);
    
    var genres = ['', '28', '12', '16', '35', '14', '53', '878', '27'];

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name,
                "actionService": serviceAction,
                "actioninfo": genres[count15],
                "action": action,
                "reaction": reaction + count14,
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
                        setCount14(count14 = document.getElementById('selector14').value);
                        setCount15(count15 = document.getElementById('selector15').value);
                        console.log(genres[count15]);
                        getCreateData();
                    }} class="add_area">Add</button>
                </div>
                <h2>Cinema</h2>
                <p>When a film with a given genre comes out</p>
                <div width="200px">
                    <select id="selector15">
                        <option value="1">Action</option>
                        <option value="2">Adventure</option>
                        <option value="3">Animation</option>
                        <option value="4">Comedy</option>
                        <option value="5">Fantasy</option>
                        <option value="6">Thriller</option>
                        <option value="7">Science Fiction</option>
                        <option value="8">Horror</option>
                    </select>
                </div>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector14">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Cinema2;