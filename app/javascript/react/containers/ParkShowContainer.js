import React, { Component } from 'react'
import ParkShowTile from '../components/ParkShowTile'
import CampsiteTile from '../components/CampsiteTile'
import HikeTile from '../components/HikeTile'
import MapTile from '../components/MapTile'



class ParkShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      park: {},
      campsites: [],
      campsearch: '',
      hikes: [],
      parkhikesearch: {},
      showMap: false,
      lat1: {},
      lon1: {}
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
      let split = body.latLong.split(',')
      let parseLat = parseFloat(split[0].replace('lat:', ''))
      let parseLon = parseFloat(split[1].replace('long:', ''))
      this.setState({ park: body, campsearch: body.parkCode, parkhikesearch: body.latLong, showMap: true, lat1: parseLat , lon1:parseLon})
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
  fetch('/api/v1/hikes')
   .then(response => {
     if(response.ok) {
       return response;
     } else {
       let errorMessage = `${ response.status }(${ response.statusText})` ,
       error = new Error(errorMessage);
       throw(error);
     }
   })
   .then(response => {
     return response.json();
   })
   .then(body => {
     this.setState({ hikes: body })
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
    let R = 6373.0

     let parkhikesearchSplit = this.state.parkhikesearch
     let lon1
     let lat1

    let hikesInPark = this.state.hikes.map(hike => {
      if (hike.latLong === ""){
        console.log(`No coordinates`)
      }
      else if (parkhikesearchSplit === ""){
        console.log(`No coordinates`)
      }
      else {
      let parsedLongs
      let hikeSplitLat
      let hikeSplitLong
      let parkhikey
      let parkHikeReplaceLats
      let parkHikeReplaceLongs
      let hikeSplit = hike.latLong.replace('[', '').replace(']', '').split(',')
      hikeSplitLat = parseFloat(hikeSplit[0])
      hikeSplitLong = parseFloat(hikeSplit[1])
      parkhikey = parkhikesearchSplit.split(',')
      parkHikeReplaceLats = parkhikey[0].replace('lat:', '')
      parkHikeReplaceLongs = parkhikey[1].replace('long:', '')
       lon1 = parkHikeReplaceLongs
      let lon2 = hikeSplitLong
       lat1 = parkHikeReplaceLats
      let lat2 = hikeSplitLat
      let dist
      	if ((lat1 == lat2) && (lon1 == lon2)) {
      		return 0;
      	}
      	else {
      		var radlat1 = Math.PI * lat1/180;
      		var radlat2 = Math.PI * lat2/180;
      		var theta = lon1-lon2;
      		var radtheta = Math.PI * theta/180;
      		 dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
      		if (dist > 1) {
      			dist = 1;
      		}
      		dist = Math.acos(dist);
      		dist = dist * 180/Math.PI;
      		dist = dist * 60 * 1.1515;
      	}

      if(dist <= 200){

      return(
        <HikeTile
          key={hike.id}
          id={hike.id}
          difficulty={hike.difficulty}
          name={hike.name}
          summary={hike.summary}
          imgSmall={hike.imgSqSmall}
        />
      )}
    }
  }
)
    let mapTile
    let zoom = 12

      mapTile = (
        <MapTile
        lat={this.state.lat1}
        lng={this.state.lon1}
        zoom={zoom}
        />
      )

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
            <div>
            {park}
            </div>
            <div>
            {mapTile}
            </div>
            <div id="campsite-tile" >
              <h1>Campsites:</h1>
              {campsInPark}
            </div>
            <div>
            Hikes:
              {hikesInPark}
            </div>
          </div>
      </div>
    )
  }
}

export default ParkShowContainer;
