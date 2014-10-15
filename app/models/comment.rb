class Comment < ActiveRecord::Base
  belongs_to :submission
  belongs_to :parent, class_name: 'Comment'
  validates :submission, presence: true
  validates :message, length: { minimum: 1 }
  validates_presence_of :parent, if: 'parent_id.present?'
end
