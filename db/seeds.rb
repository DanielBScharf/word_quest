require 'faker'

puts "Cleaning database..."
User.destroy_all

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
  )
  user.save!
end

puts 'Finished!'


puts "Cleaning database..."
Character.destroy_all

puts 'Creating 10 fake characters...'
user_ids = (1..10).to_a.shuffle
10.times do |i|
  character = Character.new(
    max_health: 100,
    current_health: Faker::Number.between(from: 0, to: 100),
    max_mana: 100,
    current_mana: Faker::Number.between(from: 0, to: 100),
    user_id: user_ids[i]
  )
  character.save!
end

puts 'Finished!'


puts "Cleaning database..."
Answer.destroy_all

puts 'Creating 10 fake answers...'
question_ids = (1..10).to_a.shuffle
10.times do |i|
  answer = Answers.new(
    correct or not ????
    question_id: question_ids[i]
  )
  answer.save!
end

puts 'Finished!'












puts "Cleaning database..."
CharacterAnswer.destroy_all

puts 'Creating 10 fake character answers...'
10.times do
  characteranswer = CharacterAnswers.new(
    time: Faker::Number.between(from: 0, to: 1000),
    answer_id: Faker::Number.between(from: 1, to: 10),
    question_id: Faker::Number.between(from: 1, to: 10),
    character_id: Faker::Number.between(from: 1, to: 10),
  )
  characteranswer.save!
end

puts 'Finished!'




puts "Cleaning database..."
Map.destroy_all

puts 'Creating 10 fake maps...'
10.times do
  map = Map.new(
    level: Faker::Number.between(from: 1, to: 10),
    completed: Faker::Boolean.boolean,
    character_id: Faker::Number.between(from: 1, to: 10)
  )
  map.save!
end

puts 'Finished!'
