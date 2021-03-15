import React, {Component} from "react";
import {Link, useHistory} from "react-router-dom";
import axios from 'axios';

import './style.css';

function Login() {
    const history = useHistory();
    async function submitMessage(event) {
        event.preventDefault();
        console.log("email = "+document.getElementById("email").value)
        console.log("password = "+document.getElementById("password").value)
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;

        var tmp = "https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/login3";
        console.log("TMP = " + tmp);

        return axios.post(tmp, JSON.stringify({
            'email': email,
            'password': password
        }))
        .then(res => {  
            console.log('res: ', res.data);
            if (res.status == 200) {
                const state = {email: email, password: password};
                localStorage.setItem('state', JSON.stringify(state));
                return history.push("/home");;              
            } else {
                console.log("Cannot Login Account not found");
                return false;
            }
        });
    }

    return (
        <div>
            <nav className="noselect">
                <a href="/#" className="space">AREA</a>
                <Link to="/register">
                    <button className="login">
                        Register 
                    </button>
                </Link>
            </nav>

            <div className="wrapper">
                <div id="formContent">
                    <h2>
                        Login
                    </h2>

                   <form action="/home" onSubmit={submitMessage}> 
                        <span><input id="email" name="email" type="text" className="entry" placeholder="Email"/></span>
                        <br></br>
                        <span><input id="password" name="password" type="password" className="entry" placeholder="Password"/></span>
                        <br></br>
                        <span><input className="send" type="submit" value="Login"/></span>
                    </form>

                    <div id="formFooter">
                        <Link to="/register">
                            <button className="login">
                                Create an account
                            </button>
                        </Link>
                    </div>
                </div>
            </div>
        </div>
     );
}

export default Login;