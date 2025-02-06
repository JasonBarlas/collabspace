class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :username, presence: true, format: { without: /\s/ }, length: { minimum: 4, maximum: 16 }, uniqueness: true

  has_many :posts, dependent: :destroy

  # Self-referential associations for friendships
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  # Reverse friendships (for mutual friendships)
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :private_messages, class_name: 'Private::Message'
  has_many :private_chats, foreign_key: :sender_id, class_name: 'Private::Chat'

  # Combine all friends
  def all_friends
    friends + inverse_friends
  end

  # Retrieve all non-friends
  def all_non_friends
    User.where.not(id: all_friends.map(&:id) + [id])
  end
end
