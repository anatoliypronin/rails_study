import React from "react"
import PropTypes from "prop-types"
class Articles extends React.Component {
  constructor(props) {
    super(props)
    this.state = { articles: [] }
  };

  fetchArticles() {
    fetch("/api/v1/articles")
      .then(response => response.json())
      .then(result => this.setState({ articles: result }))
  };

  componentDidMount() {
    this.fetchArticles()
  };

  render() {
    return (
      <React.Fragment>
        <h1>Статьи</h1>
        <table className="table table-hover">
          <tr>
            <th>Заголовок</th>
            <th>Текст</th>
            <th>Дата обновления</th>
          </tr>
          {this.state.articles.map(article =>
            <tr>
              <td>{article.title}</td>
              <td>{article.body}</td>
              <td>{article.updated_at}</td>
            </tr>
          )}
        </table>
      </React.Fragment>
    );
  }
}

export default Articles
