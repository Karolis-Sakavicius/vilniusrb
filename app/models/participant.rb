class Participant < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :username, presence: {message: 'Come on! At least come up with a funny nickname!'}
end
