import React, { useState } from "react";
import {Link} from "react-router-dom";
import axios from "axios";

import home from './assets/home.png';
import create from './assets/create.png';

import './style.css';

function Home() {
    const state = JSON.parse(localStorage.getItem('state'));
    var email = state["email"];
    
    const [cards, setCards] = useState(null);

    const getCards = async () => {
        console.log("--- getCards() ---");

        const response = await axios.post(
            'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/getcards',
             {email}
        );
        console.log(response.data);
        console.log(response.data.body);
        setCards(response.data.body);
    }

    const getActiveCards = async () => {

        console.log("--- getActiveCards() ---");
        cards && cards.map((card, index) => {
            fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/activecards',  {
                method: 'POST',
                body: JSON.stringify({
                    "email": email,
                    "cardname": card.name
                })
            })
            .then(response => response.json())
            .then((response) => {
                console.log("Server said: " + response);
            });
        });
    }

    // IF CLOCK => getActiveCards();

    return (
        <div>
            <nav class="noselect">
                <a href="/#" class="space">AREA</a>
                <Link to="/home">
                    <img src={home} alt="home" width="1.3%"/>
                    <a href="/#" class="space">Home</a>
                </Link>
                <Link to="/create_area">
                    <img src={create} alt="create" width="1.3%"/>
                    <a href="/#" class="space">Create</a>
                </Link>
                <Link to="/">
                    <button class="logout">
                        Log out 
                    </button>
                </Link>
            </nav>

            <div class="wrapper">
                <h1 class="noselect">Home</h1>
                <button onClick={() => {
                        getActiveCards();
                }} class="add_area">getActiveCards : Call API</button>
                <button onClick={() => {
                        getCards();
                }} class="add_area">Refresh</button>
            </div>
        
            <div class="wrapper">
                <div class="content_area">
                    {cards && cards.map((card, index) => {
                        return (
                            <div key={index} className="area">
                                {card.name}
                                <br></br>
                                Action: <b>{card.ServiceAction}</b>
                                <br></br>
                                {card.ActionInfo}
                                <br></br>
                                Reaction: <b>{card.ServiceReaction}</b>
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}

export default Home;