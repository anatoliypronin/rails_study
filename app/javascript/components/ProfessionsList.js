import React from "react"
import PropTypes from "prop-types"
class ProfessionsList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { professions: [] }
  };
  render () {
    return (
      <React.Fragment>
        <h1> Профессии </h1>
      </React.Fragment>
    );
  }
}

export default ProfessionsList
