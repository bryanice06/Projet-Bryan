import React from "react";
import {Link} from "react-router-dom";

import './style.css';

function Register() {
    async function submitMessage(event) {
        event.preventDefault();
        console.log("name = "+document.getElementById("name").value)
        console.log("email = "+document.getElementById("email").value)
        console.log("mdp = "+document.getElementById("message").value)
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var message = document.getElementById("message").value;
        fetch( 'https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/login2',  {
            method: 'POST',
            body: JSON.stringify({
                "firstname": name,
                "email": email,
                "password": message
            })
        })
        .then(response => {
            localStorage.setItem('state', JSON.stringify({ email: email, password: message }));
        })
        .then((response) => {
            console.log(response);
        });
    }

    return (
        <div>
            <nav className="noselect">
                <a href="/#" className="space">AREA</a>
                <Link to="/">
                    <button className="login">
                        Login
                    </button>
                </Link>
            </nav>

            <div className="wrapper">
                <div id="formContent">
                    <h2>
                        Register
                    </h2>

                    <form onSubmit={submitMessage}>
                        <span><input id="name" name="name" type="text" className="entry" placeholder="Username"/></span>
                        <span><input id="email" name="email" type="text" className="entry" placeholder="Email"/></span>
                        <span><input id="message" name="message" type="text" className="entry" placeholder="Password"/></span>
                        <br></br>
                        <span><input type="submit" className="send" value="Register"/></span>
                    </form>

                    <div id="formFooter">
                        <Link to="/">
                            <button className="login">
                                Already register?
                            </button>
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    );
}

 export default Register;