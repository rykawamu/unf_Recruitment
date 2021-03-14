# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
        name: 'taro',
        email: 'taro@example.com',
        password: 'foobar',
        password_confirmation: 'foobar'
    },
    {
        name: 'jiro',
        email: 'jiro@example.com',
        password: 'foobar',
        password_confirmation: 'foobar'
    },
    {
        name: 'saburo',
        email: 'saburo@example.com',
        password: 'foobar',
        password_confirmation: 'foobar'
    }
  ]
)