import React, { Component } from 'react'
import ParkShowTile from '../components/ParkShowTile'


class ParkShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      park: {}
    }
  }
  componentDidMount(){
    fetch(`/api/v1/parks/${this.props.params.id}`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${ response.status }(${ response.statusText })` ,
        error = new Error(errorMessage);
        throw(error);
      }
    })

    .then(response => response.json())
    .then(body => {
      this.setState({ park: body })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){

    let park
    if(this.state.park !== null) {
      park = <ParkShowTile
       key={this.state.park.id}
       id={this.state.park.id}
       state={this.state.park.state}
       latLong={this.state.park.latLong}
       description={this.state.park.description}
       designation={this.state.park.designation}
       directionsInfo={this.state.park.directionsInfo}
       fullName={this.state.park.fullName}
       directionsUrl={this.state.park.directionsUrl}
       weatherInfo={this.state.park.weatherInfo}
       parkCode={this.state.parkCode}
    />
  }
    return(
      <div>
      {park}
      </div>

    )
  }
}

export default ParkShowContainer;
