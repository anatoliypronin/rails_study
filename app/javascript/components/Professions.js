import React from "react"
import PropTypes from "prop-types"
class Professions extends React.Component {
  constructor(props) {
    super(props)
    this.state = { professions: [] }
  };

  fetchProfessions() {
    fetch("/api/v1/professions")
      .then(response => response.json())
      .then(result => this.setState({ professions: result }))
  };

  componentDidMount() {
    this.fetchProfessions()
  };

  render() {
    return (
      <React.Fragment>
        <h1>Профессии</h1>
        <table className="table table-hover">
          <tr>
            <th>Название</th>
            <th>Описание</th>
          </tr>
          {this.state.professions.map(profession =>
            <tr>
              <td>{profession.title}</td>
              <td>{profession.discription}</td>
            </tr>
          )}
        </table>
      </React.Fragment>
    );
  }
}

export default Professions
