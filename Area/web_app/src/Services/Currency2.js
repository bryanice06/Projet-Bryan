import React, {useState} from "react";

import '../style.css';

function Currency2() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Currency";
    var serviceAction= "CurrencyConverter";
    var action= "action2";
    var actionInfo= "2";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var currency;

    var [count2, setCount2] = useState(0);

    async function getInput() {
        currency = document.getElementById('currency').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("currency:" + currency + " reaction:" + count2);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + currency,
                "actionService": serviceAction,
                "actioninfo": currency,
                "action": action,
                "reaction": reaction + count2,
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
                        setCount2(count2 = document.getElementById('selector2').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Currency</h2>
                <p>When a currency exceeds the dollar</p>
                <input id="currency" class="entry2" type="text" placeholder="Currency"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector2">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Currency2;