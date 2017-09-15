import React from 'react';
import PropTypes from 'prop-types';

const Racer = props => (

  <div className="racer">

    <img
      className="sprite"
      src={props.image}
      style={{
        position: 'absolute',
        left: `${props.racer + 5}%`,
      }}
      alt="run, boy, run!"
    />

    <img className="sprite" src="images/lighthouse.gif" style={{
      float: 'right',
      transform: 'translateX(100px)',
    }} />

  </div>

);

Racer.propTypes = {
  racer: PropTypes.number.isRequired,
};

export default Racer;
