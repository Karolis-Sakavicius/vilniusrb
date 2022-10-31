class Participant < ApplicationRecord
  has_many :posts, dependent: :destroy
end
