# first user is the "logged in" user accessed with GET /users/me
User.create!({username: Faker::GameOfThrones.character})