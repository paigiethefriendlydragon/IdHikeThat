import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import ParkContainer from './ParkContainer'

const App = props => {
  return(
    <Router history={browserHistory}>
    <Route path='/' component= {ParkContainer}/>
    <Route path='/parks' component= {ParkContainer}/>
    </Router>
  )
}

export default App
