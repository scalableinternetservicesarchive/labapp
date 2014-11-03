class Comment < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  belongs_to :parent, class_name: 'Comment'
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
  validates :submission, presence: true
  validates :user, presence: true
  validates :message, length: { minimum: 1 }
  validates_presence_of :parent, if: 'parent_id.present?'

  attr_accessor :randomized

  before_validation do
    if self.randomized

      self.submission = Submission.order("RANDOM()").first
      if (rand < 0.8)
        self.parent = self.submission.comments.to_a.sample
      else
        self.parent = nil
      end
      self.user = User.order("RANDOM()").first

      self.message = (1+(20*rand).to_i).times.map{ ((7*rand).to_i).times.map { (65+rand(26)).chr }.join}.join(" ")
    end
  end

  
end
