class Poll < ActiveRecord::Base
  attr_accessible :author_id, :title

  validates :author_id, :title, :presence => true

  belongs_to :author, :class_name => "User"
  has_many :questions
end
