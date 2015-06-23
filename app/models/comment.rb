class Comment < ActiveRecord::Base
  belongs_to :lost
  belongs_to :user

  validates :comment, presence: true
  validates :user_id, presence: true
end
