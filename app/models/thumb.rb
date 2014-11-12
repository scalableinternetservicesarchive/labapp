class Thumb < ActiveRecord::Base
  validates :path, presence: true
  validates :name, length: { minimum: 5 }
end
