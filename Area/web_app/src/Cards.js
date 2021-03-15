import React, { Component } from "react";

import './style.css';

class Cards extends React.Component {
    constructor() {
        super();
        this.state = {
            email: "email",
            name: "name",
            serviceAction: "serviceAction",
            action: "action",
            actionInfo: "actionInfo",
            serviceReaction: "serviceReaction",
            reaction: "reaction",
            reactionInfo: "reactionInfo"
        };
    }

    static getDerivedStateFromProps(props, state) {
        return {
            email: props.email,
            name: props.name,
            serviceAction: props.serviceAction,
            action: props.action,
            actionInfo: props.actionInfo,
            serviceReaction: props.serviceReaction,
            reaction: props.reaction,
            reactionInfo: props.reactionInfo
        };
    }

    render() {
        return (
            <p> 
                {this.state.name}
                <br></br>
                {this.state.serviceAction}
                <br></br>
                {this.state.action}
                <br></br>
                {this.state.actionInfo}
                <br></br>
                {this.state.serviceReaction}
                <br></br>
                {this.state.reaction}
                <br></br>
                {this.state.reactionInfo}
            </p>
        )
    }
}

export default Cards;