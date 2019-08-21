import React, {Component} from 'react'
import {Map, Marker, GoogleApiWrapper} from 'google-maps-react'
import { MAPS_API_KEY } from './credentials.js';

class MapTile extends Component {
  render(){

    const lat = this.props.lat
    const lng = this.props.lng

    const style = {
      width: `300px`,
      height: `300px`
    }
    return (
      <div className= "map">
      <Map
      google={this.props.google}
      initialCenter={{
        lat: lat,
        lng: lng
    }}
      style={style}>
      <Marker />
      </Map>
      />
      </div>
    )}
  }

export default GoogleApiWrapper({
 apiKey: MAPS_API_KEY
})(MapTile);
