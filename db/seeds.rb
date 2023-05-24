require 'faker'

puts "Cleaning database..."
Answer.destroy_all
Question.destroy_all
Monster.destroy_all
Map.destroy_all
Character.destroy_all
User.destroy_all

puts 'Creating 1 fake user...'

user = User.new(
  email: 'mail@mail.com',
  first_name: 'Dumbkid1',
  last_name: "d",
  username: "d",
  password: 'secret'
)
user.save!

puts 'Finished!'


puts "Cleaning database..."


puts 'Creating 1 fake character...'

character = Character.new(
  name: "Dumbkid1",
  max_health: 100,
  current_health: Faker::Number.between(from: 0, to: 100),
  max_mana: 100,
  current_mana: Faker::Number.between(from: 0, to: 100),
  user_id: User.all.first.id,
  level: 2,
  language: 'English'
)
character.save!

puts 'Finished!'

puts 'Creating fake map...'
map = Map.new(
  completed: false,
  character_id: Character.all.sample.id
)
map.save!

puts 'Finished!'


puts 'Populating monsters'

monster = Monster.new(
  name: "rat",
  category: "vocabulary",
  map: Map.all.sample
)
monster.save!

monster = Monster.new(
  name: "wolf",
  category: "reading",
  map: Map.all.sample
)
monster.save!

monster = Monster.new(
  name: "bat",
  category: "grammar",
  map: Map.all.sample
)
monster.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "What is the airspeed velocity of an unlaiden swallow"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.sample,
  correct: true,
  text: "What? An African or a European sqallow?"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.sample,
  correct: true,
  text: "34kph"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.sample,
  correct: true,
  text: "I don't know that!"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.sample,
  correct: true,
  text: "Green!"
)
answer.save!
