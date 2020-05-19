# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Profession.create(title:"Web-дизайн", description:"Тут описание профессии", state:"active")
Profession.create(title:"Flash-анимация", description:"Тут описание профессии", state:"active")
Profession.create(title:"Разработка баз данных", description:"Тут описание профессии", state:"active")
Profession.create(title:"JS-backend", description:"Тут описание профессии", state:"active")
Admin.create(name:'Admin', email:'admin@email.ru', password:'admin')
Teacher.create(first_name:'Teacher', last_name:'First', email:'teacher@email.ru', password:'teacher')