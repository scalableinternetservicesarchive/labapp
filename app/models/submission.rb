class Submission < ActiveRecord::Base
  belongs_to :community
  has_many :comments
  validates :community, presence: true
  validates :title, length: { minimum: 5 }, uniqueness: true
  validates :url, url: true

  attr_accessor :randomized

  before_validation do
    if self.randomized
      self.community = Community.order("RANDOM()").first
      self.title = 8.times.map { (65+rand(26)).chr }.join
      self.url = "http://www.cs290.com/#{8.times.map { (65+rand(26)).chr }.join}"
    end
  end

  def root_comments
    comments.where parent_id: nil
  end

end
