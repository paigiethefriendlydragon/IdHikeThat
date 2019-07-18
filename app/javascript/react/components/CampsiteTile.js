import React from 'react';
import { Link } from 'react-router';

const CampsiteTile = props => {

  return(
    <div id="campsite-tile">
      <h3>Campsites</h3>
          <p>Name: {props.name}</p>
        <h4>Description:</h4>
          <p> {props.description} </p>
    </div>

  )
}
export default CampsiteTile;
