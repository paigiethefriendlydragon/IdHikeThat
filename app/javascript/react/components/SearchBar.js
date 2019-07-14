import React, { Component } from 'react';


class SearchBar extends Component{
  constructor(props){
    super(props);
    this.state = {
      parks: [],
      searchString: ''
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleChange(event) {
    const newSearchString = event.target.value
    this.setState({ searchString: newSearchString})
  }
  handleSubmit(event) {
    event.preventDefault()
    const body = JSON.stringify({
      searchString: this.state.searchString
    })
      fetch('/api/v1/parks/search.json', {
        method: 'POST',
        body: body,
        credentials: 'same-origin',
        headers: { 'Accept': 'application/json', 'Content-type': 'application/json'}
      })
      .then(response => response.json())
      .then(body => {
        this.setState({parks: body })
    })
  }
  render(){
    const parks = this.state.parks.map(park => {
      return(
        <li>{park.name}</li>
      )
    })
    return(
      <div>
          <form onSubmit={this.handleSubmit}>
              <label>Search</label>
              <input type='text' name='searchString' value={this.state.searchString} onChange={this.handleChange} />

              <input type='submit' value= 'Submit' />
            </form>
          <ul>{parks}</ul>
        </div>
    )
  }
 }
 export default SearchBar;
