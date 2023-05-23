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
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  username: Faker::Internet.username,
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
  user_id: User.all.sample.id,
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
