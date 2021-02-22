import React from 'react'
import { Route, Switch } from 'react-router-dom'
import Instruments from './Instruments'

const App = () => {
  return(
    <Switch>
      <Route exact path="/instruments" component={Instruments} />
    </Switch>
  )
}

export default App