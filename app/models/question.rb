class Question < ActiveRecord::Base
  attr_accessible :prompt
  
  has_many :answer_choices
  belongs_to :poll
  has_one :poll_author, :through => :poll, :source => :author
  has_many :responses, :through => :answer_choices
end
