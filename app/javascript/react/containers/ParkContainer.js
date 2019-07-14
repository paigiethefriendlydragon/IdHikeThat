import React, { Component } from 'react'
import ParkTile from '../components/ParkTile'

class ParkContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      parks: []

    }

  }
  componentDidMount(){
      fetch('/api/v1/parks')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => {
        return response.json();
      })
      .then(body => {
        this.setState({ parks: body })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
    }

  render(){
    let parks = this.state.parks.map(park => {
    return(
      <ParkTile
        key={park.id}
        name={park.fullName}
        id={park.id}
        description={park.description}
        />
    )
  })
    return(

      <div className="">
          {parks}
     </div>

    )
  }
}
export default ParkContainer;
