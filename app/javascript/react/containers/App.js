import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import ParkContainer from './ParkContainer'
import ParkShowContainer from './ParkShowContainer'
import SearchBar from '../components/SearchBar'

const App = props => {
  return(
    <Router history={browserHistory}>
    <Route path='/' component= {ParkContainer}/>
    <Route path='/parks' component= {ParkContainer}/>
    <Route path='/parks/:id' component= {ParkShowContainer}/>
    <Route path='/parks/search' component= {SearchBar}/>
    </Router>
  )
}

export default App
