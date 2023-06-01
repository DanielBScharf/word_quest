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
  name: "ratcave",
  category: "vocabulary",
  map: Map.find_by_name("cave"),
  max_health: 3,
  current_health: 3
)
monster.save!

monster = Monster.new(
  name: "batpurple",
  category: "vocabulary",
  map: Map.find_by_name("cave"),
  max_health: 3,
  current_health: 3
)
monster.save!

monster = Monster.new(
  name: "warrior",
  category: "vocabulary",
  map: Map.find_by_name("castle"),
  max_health: 3,
  current_health: 4
)
monster.save!

monster = Monster.new(
  name: "dragon",
  category: "vocabulary",
  map: Map.find_by_name("castle"),
  max_health: 3,
  current_health: 5
)
monster.save!

monster = Monster.new(
  name: "skeleton",
  category: "vocabulary",
  map: Map.find_by_name("cave"),
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
  correct: false,
  text: "go"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
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
  correct: false,
  text: "His"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
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
  correct: false,
  text: "have"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
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


puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ English for two years."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "have been studying"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "study"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "am studying"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will studied"
)
answer.save!


puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "My sister _____ to the store to buy some groceries.
  "
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "go"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "was go"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "is going"
)
answer.save!

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
  text: "Which word means: a piece of paper with information that allows you to enter a building or travel on public transportation?"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "Document"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "ticket"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "passport"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "reciept"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Which word best completes the following sentence: I need to __________ my keys before I leave the house."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "lose"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "cook"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "drive"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "find"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Which word is the opposite of 'hot'?"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "cold"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "fast"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "tall"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "slow"
)
answer.save!


puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Which word is the most appropriate to complete the following sentence: I need to buy some ________ for the party."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "medicine"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "decorations"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "bread"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "future"
)
answer.save!

puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Which word best completes the sentence: I have a ____________ in the morning, so I need to wake up early."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "meeting"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "party"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "bread"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "cat"
)
answer.save!


question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Which of the following words is the closest in meaning to the word 'exhausted'?"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "angry"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "hungry"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "tired"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "excited"
)
answer.save!

question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "Which word means 'a large group of stars held together by gravity'?"
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "solar"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "planet"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "astroid"
)
answer.save!

answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "galaxy"
)
answer.save!
