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
  icon_name: 'Doug.png'
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
  text: "Choose the correct word to complete the sentence: I ________ to the park every Sunday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: 1,
  correct: true,
  text: "goed"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: 1,
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: 1,
  correct: false,
  text: "go"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: 1,
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
  question: 2,
  correct: false,
  text: "His"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: 2,
  correct: false,
  text: "He"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: 2,
  correct: false,
  text: "Them"
)
answer.save!
puts 'creating answers'
answer = Answer.new(
  question: 2,
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
  question: 3,
  correct: true,
  text: "have"
)
answer.save!

answer = Answer.new(
  question: 3,
  correct: true,
  text: "has"
)
answer.save!

answer = Answer.new(
  question: 3,
  correct: true,
  text: "having"
)
answer.save!

answer = Answer.new(
  question: 3,
  correct: true,
  text: "will"
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
