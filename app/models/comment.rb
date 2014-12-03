class Comment < ActiveRecord::Base
  belongs_to :submission, touch: true
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', touch: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
  validates :submission, presence: true
  validates :user, presence: true
  validates :message, length: { minimum: 1 }
  validates_presence_of :parent, if: 'parent_id.present?'
end
