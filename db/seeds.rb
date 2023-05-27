require 'faker'

puts "Cleaning database..."
CharacterAnswer.destroy_all
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
  user_id: user.id,
  level: 2,
  language: 'English',
  icon_name: 'hero.png'
)
character.save!


character = Character.new(
  name: "Char2",
  max_health: 100,
  current_health: Faker::Number.between(from: 0, to: 100),
  max_mana: 100,
  current_mana: Faker::Number.between(from: 0, to: 100),
  user_id: user.id,
  level: 1,
  language: 'English',
  icon_name: 'doug.png'
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
  correct: false,
  text: "34kph"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.sample,
  correct: false,
  text: "I don't know that!"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.sample,
  correct: false,
  text: "Green!"
)
answer.save!



puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "How old are you?\n\nA I am fine\nB I have 27 years\nC I am 27 years old\nD I have 27 years old"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: question,
  correct: true,
  text: "A I am fine"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He went to the Stadium _____\n\nA on taxi\nB by taxi\nC with taxi\nD in taxi"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: question,
  correct: true,
  text: "B by taxi"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We haven't got _____ money.\n\nA no\nB a lot of\nC lots of\nD any"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: question,
  correct: true,
  text: "D any"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He plays soccer _____.\n\nA on Wednesdays\nB at Wednesdays\nC by Wednesdays\nD in Wednesdays"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: question,
  correct: true,
  text: "A on Wednesdays"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ a teacher.\n\nA isn't\nB am'nt\nC aren't\nD am not"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: question,
  correct: true,
  text: "D am not"
)
answer.save!
