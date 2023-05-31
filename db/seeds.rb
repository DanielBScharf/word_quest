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
  current_health: 100,
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
  current_health: 100,
  max_mana: 100,
  current_mana: Faker::Number.between(from: 0, to: 100),
  user_id: user.id,
  level: 1,
  language: 'English',
  icon_name: 'Doug.png'
)
character.save!

puts 'Finished!'

puts 'Creating map...'
map = Map.new(
  completed: false,
  name: 'castle',
  character_id: Character.all.sample.id
)
map.save!

puts 'Creating map...'
map = Map.new(
  completed: false,
  name: 'ruin',
  character_id: Character.all.sample.id
)
map.save!

puts 'Creating map...'
map = Map.new(
  completed: false,
  name: 'cave',
  character_id: Character.all.sample.id
)
map.save!

puts 'Creating map...'
map = Map.new(
  completed: false,
  name: 'world',
  character_id: Character.all.sample.id
)
map.save!

puts 'Finished!'


puts 'Populating monsters'

monster = Monster.new(
  name: "rat",
  category: "vocabulary",
  map: Map.find_by_name("castle"),
  max_health: 3,
  current_health: 3
)
monster.save!

monster = Monster.new(
  name: "wolf",
  category: "reading",
  map: Map.find_by_name("ruin"),
  max_health: 4,
  current_health: 4
)
monster.save!

monster = Monster.new(
  name: "bat",
  category: "grammar",
  map: Map.find_by_name("cave"),
  max_health: 3,
  current_health: 3
)
monster.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Choose the correct word to complete the sentence: I ________ to the park every Sunday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "goed"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "go"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "goes"
)
answer.save!



puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "________ name is Tom. He is from England."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "His"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "He"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "Them"
)
answer.save!
puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "She"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ a cat."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "have"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "has"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "having"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will"
)
answer.save!
