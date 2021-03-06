class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates(:password_confirmation, presence: true)
  has_many :posts, dependent: :destroy
  has_many :workouts, dependent: :destroy
  serialize :current_max
end
