import React from "react"
import PropTypes from "prop-types"
class Reviews extends React.Component {
  constructor(props) {
    super(props)
    this.state = { reviews: [] }
  };

  fetchReviews() {
    fetch("/api/v1/reviews")
      .then(response => response.json())
      .then(result => this.setState({ reviews: result }))
  };

  componentDidMount() {
    this.fetchReviews()
  };

  render() {
    return (
      <React.Fragment>
        <h1>Отзывы</h1>
        <table className="table table-hover">
          <tr>
            <th>Курс</th>
            <th>Студент</th>
            <th>Текст</th>
          </tr>
          {this.state.reviews.map(review =>
            <tr>
              <td>{review.course.title}</td>
              <td>{review.student.first_name} + {review.student.last_name}</td>
              <td>{review.body}</td>
            </tr>
          )}
        </table>
      </React.Fragment>
    );
  }
}

export default Reviews
