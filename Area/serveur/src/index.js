import React from "react";
import ReactDOM from "react-dom";
import {BrowserRouter, Route, Switch} from "react-router-dom";

import Print from "./Print";

const rootElement = document.getElementById("root");
ReactDOM.render(
    <BrowserRouter>
        <Switch>
            <Route exact path="/about.json" component={Print}/>
        </Switch>
    </BrowserRouter>,
    rootElement
);