import React, {useState} from "react";

import '../style.css';

function Currency() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];

    var name= "Currency";
    var serviceAction= "CurrencyConverter";
    var action= "action1";
    var actionInfo= "1";
    var serviceReaction= "Imgur";
    var reaction= "reaction";
    var reactionInfo= "2e8d1f56ce7b813004e74d1ccc9b88eaffe1cce1";
    var currency1;
    var currency2;

    var [count1, setCount1] = useState(0);

    async function getInput() {
        currency1 = document.getElementById('currency1').value;
        currency2 = document.getElementById('currency2').value;
        displayParams();
        getCreateData();
    }

    async function displayParams() {
        console.log("currency1:" + currency1 + " currency2:" + currency2 + " reaction:" + count1);
    }

    async function getCreateData() {
        console.log("--- getCreateData() ---");
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard',  {
            method: 'POST',
            body: JSON.stringify({
                "email": email,
                "name": name + currency1 + currency2,
                "actionService": serviceAction,
                "actioninfo": currency1 + "/" + currency2,
                "action": action,
                "reaction": reaction + count1,
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
                        setCount1(count1 = document.getElementById('selector1').value);
                        getInput();
                    }} class="add_area">Add</button>
                </div>
                <h2>Currency</h2>
                <p>When one currency is exceeded by another</p>
                <input id="currency1" class="entry2" type="text" placeholder="Currency one"/>
                <input id="currency2" class="entry2" type="text" placeholder="Currency two"/>
                <br></br>
                <b>Reaction: Imgur</b>
                <div width="200px">
                    <select id="selector1">
                        <option value="1">Favorite a random photo</option>
                        <option value="2">Like a random photo</option>
                        <option value="3">Dislike a random photo</option>
                    </select>
                </div>
            </div>
        </div>
    );
}

export default Currency;