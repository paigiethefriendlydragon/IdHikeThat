import React, { Component } from 'react'
import ParkShowTile from '../components/ParkShowTile'
import CampsiteTile from '../components/CampsiteTile'



class ParkShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      park: {},
      campsites: [],
      campsearch: ''
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
     .then(response => {
       return response.json();
  })
    .then(body => {
      this.setState({ park: body, campsearch: body.parkCode })
    })
    fetch('/api/v1/campsites')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${ response.status }(${ response.statusText })` ,
        error = new Error(errorMessage);
        throw(error);
      }
    })
     .then(response => {
       return response.json();
  })
  .then(body => {
    this.setState({ campsites: body })
  })

    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    let campsInPark = this.state.campsites.map(campsite => {
      if(this.state.campsearch === campsite.parkCode) {
      return(
        <CampsiteTile
          key={campsite.id}
          id={campsite.id}
          regulationsurl={campsite.regulationsurl}
          weatheroverview={campsite.weatheroverview}
          campsites={campsite.campsites}
          accessibility={campsite.accessibility}
          directionsoverview={campsite.directionsoverview}
          reservationsurl={campsite.reservationsurl}
          directionsUrl={campsite.directionsUrl}
          reservationssitesfirstcome={campsite.reservationssitesfirstcome}
          regulationsoverview={campsite.regulationsoverview}
          latLong={campsite.latLong}
          description={campsite.description}
          reservationssitesreservable={campsite.reservationssitesreservable}
          parkCode={campsite.parkCode}
          amenities={campsite.amenities}
          reservationsdescription={campsite.reservationsdescription}
          name={campsite.name}
        />
      )}
      else{
        console.log(`No match`)
      }
    })


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
          <div>
          {park}
          {campsInPark}
          </div>
      </div>
    )
  }
}

export default ParkShowContainer;
