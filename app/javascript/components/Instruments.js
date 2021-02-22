import React, {Fragment, useState, useEffect } from 'react'
import axios from 'axios';


const Instruments = () => {
  // try hooks for this
  const [instruments, setInstruments] = useState([]);

  useEffect(() => {
    axios.get('/api/v1/instruments')
    .then(res => {
      setInstruments(res.data.data)
    })
    .catch(res => console.log(res))
  }, [instruments.length]) // effect will re-run only if instruments changes. revisit docs.

  const currentInstruments = instruments.map(item => {
    return(
      <p key={item.attributes.name}>name: {item.attributes.name}</p>
    )
  })

  return(
    <div>
      <p>To do: plan out the flow of these routes</p>
      {currentInstruments}
    </div>
  )
}

export default Instruments