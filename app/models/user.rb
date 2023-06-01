class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true, on: :create
  # validates :last_name, presence: true, on: :create
  # validates :username, presence: true, uniqueness: true, on: :create
  has_many :characters
  belongs_to :current_character, optional: true, class_name: 'Character'
end
