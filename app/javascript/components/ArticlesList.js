import React from "react"
import PropTypes from "prop-types"
class ArticlesList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { articles: [] }
  };

  fetchArticles() {
    fetch('api/v1/articles')
      .then(response => response.json())
      .then(result => this.setState({articles: result}))
  };

  componentDidMount() {
    this.fetchArticles()
  };

  render () {
    return (
      <React.Fragment>
        <h1> Статьи </h1>
        <table className='table table-hover'>
          <tr>
            <th>Название</th>
            <th>Описание</th>
          </tr>
          {this.state.articles && this.state.articles.map(articles => (
            <tr>
              <td>{articles.title}</td>
              <td>{articles.body}</td>
          </tr>
          ))}
        </table>
      </React.Fragment>
    );
  }
}

export default ArticlesList
