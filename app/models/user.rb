class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :username, presence: true, format: { without: /\s/ }, length: { minimum: 4, maximum: 16 }, uniqueness: true

  has_many :posts, dependent: :destroy
end
