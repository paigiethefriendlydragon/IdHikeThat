import React from 'react';
import { Link } from 'react-router';

const HikeTile = props => {

  return(
    <div id="hike-tile">
      <h1> {props.name}</h1>
      <p> {props.difficulty}</p>
    </div>
  )
}

    export default HikeTile;
