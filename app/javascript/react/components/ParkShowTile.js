import React from 'react';
import { Link } from 'react-router';

const ParkShowTile = props => {
  return(
<div>
    <div className="park-title">
      <h1>{props.fullName}</h1>
    </div>

    <div id="park-show-tile-about" className="">
      <h3> About the Park</h3>
        <h4>Description:</h4>
          <p> {props.description}</p>
          <p> Park Type: {props.designation}</p>
        <h4> Weather Info: </h4>
          <p>{props.weatherInfo}</p>
    </div>

    <div id="park-show-tile" className="">
      <h3> Where it's at:</h3>
        <p> State: {props.state}</p>
        <p> {props.latLong}</p>
        <p> Direction info: {props.directionsInfo}</p>
        <p>Directions link: {props.directionsUrl} </p>
    </div>
</div>
  )
}

export default ParkShowTile;
