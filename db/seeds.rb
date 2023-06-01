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
  current_health: 3
)
monster.save!

monster = Monster.new(
  name: "dragon",
  category: "vocabulary",
  map: Map.find_by_name("castle"),
  max_health: 3,
  current_health: 3
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

# add questions and answers
# Question 1
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ a book every night."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "reading"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "reads"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "read"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "has been reading"
)
answer.save!

# Question 2
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ to the beach last summer."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "goes"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "has gone"
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
  text: "went"
)
answer.save!

# Question 3
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ a new car last month."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "buy"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have bought"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "bought"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "bought"
)
answer.save!

# Question 4
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ in the park every weekend."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "plays"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "play"
)
answer.save!

# Question 1
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "My brother _____ football every Saturday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "plays"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "is playing"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "plays"
)
answer.save!

# Question 2
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ their homework yesterday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "do"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "did"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have done"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "did"
)
answer.save!

# Question 3
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ to the movies last night."
)
question.save!

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
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have gone"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "went"
)
answer.save!

# Question 4
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ his grandmother every Sunday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "visits"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "visited"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will visit"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "visits"
)
answer.save!

# Question 5
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ the bus to work every day."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "takes"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "took"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will take"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "takes"
)
answer.save!

# Question 6
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ my friend last night."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "see"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "saw"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have seen"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "saw"
)
answer.save!

# Question 7
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ in the garden yesterday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "played"
)
answer.save!

# Question 8
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ TV every evening."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watching"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watches"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watched"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "watches"
)
answer.save!

# Question 9
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ breakfast at 7 o'clock."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "eat"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "ate"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have eaten"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "eat"
)
answer.save!

# Question 10
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ to the party last night."
)
question.save!

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
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have gone"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "went"
)
answer.save!

# Question 11
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ coffee in the morning."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "drink"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "drinks"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "drank"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "drinks"
)
answer.save!

# Question 12
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ a movie last weekend."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watch"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watched"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have watched"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "watched"
)
answer.save!

# Question 13
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ to work by car."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "goes"
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
  correct: false,
  text: "will go"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "goes"
)
answer.save!

# Question 14
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ lunch at the restaurant."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "eat"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "ate"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have eaten"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "eat"
)
answer.save!

# Question 15
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ her dog for a walk every morning."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "walks"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "walked"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will walk"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "walks"
)
answer.save!

# Question 16
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ in the park yesterday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "played"
)
answer.save!

# Question 17
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ basketball with his friends."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "plays"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "plays"
)
answer.save!

# Question 18
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ my favorite book last night."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "see"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "saw"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have seen"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "saw"
)
answer.save!

# Question 19
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ at the beach yesterday."
)
question.save!

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
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have gone"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "went"
)
answer.save!

# Question 20
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ the piano very well."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "plays"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "plays"
)
answer.save!

# Question 21
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ football every Saturday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "play"
)
answer.save!

# Question 22
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ to the store to buy some milk."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "goes"
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
  correct: false,
  text: "will go"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "goes"
)
answer.save!

# Question 23
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ a new car last month."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "see"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "saw"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have seen"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "saw"
)
answer.save!

# Question 24
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ dinner together every evening."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "eat"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "ate"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have eaten"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "eat"
)
answer.save!

# Question 25
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ TV every evening."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watch"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watches"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watched"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "watches"
)
answer.save!

# Question 26
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ up early every morning."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "wakes"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "waked"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will wake"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "wakes"
)
answer.save!

# Question 27
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ to the party last night."
)
question.save!

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
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have gone"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "went"
)
answer.save!

# Question 28
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ a shower every morning."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "takes"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "took"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will take"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "takes"
)
answer.save!

# Question 29
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ pizza for dinner yesterday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "eat"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "ate"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have eaten"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "ate"
)
answer.save!

# Question 30
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ in a big city."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "live"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "lived"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have lived"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "live"
)
answer.save!

# Question 31
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ English every day."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "study"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "studied"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have studied"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "studies"
)
answer.save!

# Question 32
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "I _____ a movie last night."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watch"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watches"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "watched"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "watched"
)
answer.save!

# Question 33
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ at the park yesterday."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "played"
)
answer.save!

# Question 34
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ coffee in the morning."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "drink"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "drank"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have drunk"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "drinks"
)
answer.save!

# Question 35
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ to the beach last summer."
)
question.save!

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
  correct: false,
  text: "went"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have gone"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "went"
)
answer.save!

# Question 36
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ a bike to work every day."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "ride"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "rode"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have ridden"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "rides"
)
answer.save!

# Question 37
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "They _____ basketball at the park."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "play"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have played"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "play"
)
answer.save!

# Question 38
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "She _____ a book in her free time."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "read"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "readed"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "will read"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "reads"
)
answer.save!

# Question 39
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "We _____ in the same class."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "study"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "studied"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have studied"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "study"
)
answer.save!

# Question 40
puts 'pondering questions'
question = Question.new(
  category: "CEFR A1",
  monster: Monster.all.sample,
  text: "He _____ to music every day."
)
question.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "listen"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "listened"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: false,
  text: "have listened"
)
answer.save!

puts 'creating answers'
answer = Answer.new(
  question: Question.all.last,
  correct: true,
  text: "listens"
)
answer.save!
