import React from 'react';
import { Link } from 'react-router';

const HikeTile = props => {

  return(
    <div id="hike-tile">
      <h3>Hike</h3>
      <img src={props.imgSmall} />
        <p> {props.name}</p>
          <h4>Description:</h4>
              <p> {props.summary} </p>
          <h4>Difficulty:</h4>
              <p> {props.difficulty}</p>
    </div>
  )
}

export default HikeTile;
