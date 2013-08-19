class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text

  validates :poll_id, :text, :presence => true

  has_many :answer_choices
  belongs_to :poll
end
