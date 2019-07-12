import React, { Component } from 'react'


class ParkContainer extends Component {
  constructor(props){
    super(props);
    this.state = {

    }

  }

  render(){

    return(
      <div className="speech-bubble">
        <div className="image-text">
          <h1> I'd Hike That! </h1>
        </div>
        <h2> Search your park </h2>
        <h3> OR </h3>
        <h2> Choose from THE LIST </h2>
      </div>
    )
  }
}
export default ParkContainer
