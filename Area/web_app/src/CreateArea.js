import React, { useState, useEffect } from 'react';
import {Link} from "react-router-dom";

import Weather from './Services/Weather';
import Weather2 from './Services/Weather2';
import Weather3 from './Services/Weather3';
import Currency from './Services/Currency';
import Currency2 from './Services/Currency2';
import Cinema from './Services/Cinema';
import Cinema2 from './Services/Cinema2';
import Imgur from './Services/Imgur';
import NASA from './Services/NASA';
import NASA2 from './Services/NASA2';
import Pollution from './Services/Pollution';
import Pollution2 from './Services/Pollution2';
import Pollution3 from './Services/Pollution3';
import Riot from './Services/Riot';
import Riot2 from './Services/Riot2';

import home from './assets/home.png';
import create from './assets/create.png';

import './style.css';

function CreateArea() {

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
                <h1 class="noselect">Create</h1>
            </div>

            <div class="wrapper">
                <div class="content_area">
                    <Weather/>
                    <Weather2/>
                    <Weather3/>
                    <Imgur/>
                </div>
                <div class="content_area">
                    <Currency/>
                    <Currency2/>
                    <Riot/>
                    <Riot2/>
                </div>
                <div class="content_area">
                    <Cinema/>
                    <Cinema2/>
                    <NASA/>
                    <NASA2/>
                </div>
                <div class="content_area">
                    <Pollution/>
                    <Pollution2/>
                    <Pollution3/>
                </div>
            </div>
        </div>
    );
}

export default CreateArea;