import React from "react"
import PropTypes from "prop-types"
class Articles extends React.Component {
  article_id = null;

  constructor(props) {
    super(props)
    this.state = { articles: [] }
    this.article_id = null
  };

  setArticleId(id) {
    this.article_id = id
    this.componentDidMount()
  }

  fetchArticles() {
    fetch("/api/v1/articles")
      .then(response => response.json())
      .then(result => this.setState({ articles: result }))
    this.article_id = null
  };

  fetchArticle() {
    fetch("/api/v1/articles/" + this.article_id)
      .then(response => response.json())
      .then(result => this.setState({ articles: result }))
  }

  componentDidMount() {
    if(this.article_id == null)
      this.fetchArticles()
    else
      this.fetchArticle(this.article_id)
  };

  render() {
    if(this.article_id != null){
      return <h1>{this.state.articles.title}</h1>;
    } else {
      return (
        <React.Fragment>
          <h1>Статьи</h1>
          <table className="table table-hover">
            <tr>
              <th>Заголовок</th>
              <th>Текст</th>
              <th>Дата обновления</th>
              <th></th>
            </tr>
            {this.state.articles.map(article =>
              <tr>
                <td>{article.title}</td>
                <td>{article.body}</td>
                <td>{article.updated_at}</td>
                <td><button onClick={this.setArticleId(article.id)}>Показать</button></td>
              </tr>
            )}
          </table>
        </React.Fragment>
      );
    }
  }
}

export default Articles
