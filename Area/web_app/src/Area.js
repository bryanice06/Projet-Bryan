import React from "react";

import './style.css';

function Area(props) {
    return (
        <div>
            <div className={props.class}>
                <b>{props.name}</b>
                <br></br>
                {props.surname}
                <br></br>
                <b>{props.app}</b>
                <br></br>
                {props.trigger_event}
                <br></br>
                <b>{props.action}</b>
                <br></br>
                {props.action_event}
            </div>
        </div>
    );
}

export default Area;