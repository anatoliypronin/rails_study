import React from "react"
import PropTypes from "prop-types"
class Welcome extends React.Component {
    render() {
        return (
            <React.Fragment>
                <main role='main'>
                    <div class='jumbotron'>
                        <div class='container'>
                            <h1 class='display-3'>Проект Study!</h1>
                            <p>Хочешь стать профессионалом в сфере IT? Или подтянуть свои знания?
                                Мы предлагаем быстрый и качественный образовательный сервис, на котором ты можешь изучить профессию ОТ И ДО и стать высокооплачиваемым специалистом.
                                Смотри уроки, делай домашку и будь лучшим среди лучших.</p>
                            <b>Начни учиться прямо сейчас!</b>
                        </div>
                    </div>
                </main>
                <div class='container'>
                    <div class='row'>
                        <div class='col-md-4'>
                            <center>
                                <img src = "../articles.png" width = '250' height = '250'/>
                                    <h2>Статьи</h2>
                                    <p>Здесь ты можешь найти для себя много новой и интересной информации.</p>
                                    <p>
                                        <a class='btn btn-secondary' href='/articles'>Больше >></a>
                                    </p>
                            </center>
                        </div>
                        <div class='col-md-4'>
                            <center>
                                <img src = "../professions.png" width = '250' height = '250'/>
                                    <h2>Профессии</h2>
                                    <p>Выбери профессию по душе и начни обучаться уже сейчас!</p>
                                    <p>
                                        <a class='btn btn-secondary' href='/professions'>Больше >></a>
                                    </p>
                            </center>
                        </div>
                        <div class='col-md-4'>
                            <center>
                                <img src = "../reviews.png" width = '250' height = '250'/>
                                    <h2>Отзывы</h2>
                                    <p>Отзывы студентов, прошедших обучение на нашем портале.</p>
                                    <p>
                                        <a class='btn btn-secondary' href='/reviews'>Больше >></a>
                                    </p>
                            </center>
                        </div>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

export default Welcome
