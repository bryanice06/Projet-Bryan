import React from "react";
import ReactDOM from "react-dom";
import {BrowserRouter, Route, Switch} from "react-router-dom";

import Login from "./Login";
import Register from "./Register";
import Home from "./Home";
import CreateArea from "./CreateArea";

const rootElement = document.getElementById("root");
ReactDOM.render(
    <BrowserRouter>
        <Switch>
            <Route exact path="/" component={Login}/>
            <Route path="/register" component={Register}/>
            <Route path="/home" component={Home}/>
            <Route path="/create_area" component={CreateArea}/>
        </Switch>
    </BrowserRouter>,
    rootElement
);