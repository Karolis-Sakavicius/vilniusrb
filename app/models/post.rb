class Post < ApplicationRecord
  belongs_to :participant

  validates :text, length: {maximum: 256, message: 'So many emotions!!! But try to compress them down to 256 chars. ^_^'}
  validates :text, presence: {message: 'Nothing to share? :-('}

  # validate :dont_spam

  private

  def dont_spam
    last_post = participant.posts.order(:created_at).last

    if last_post && last_post.created_at > Time.current - 1.minute
      errors.add(:base, 'Hey hey! Slow down! Let the others post as well!')
    end
  end
end
