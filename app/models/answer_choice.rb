class AnswerChoice < ActiveRecord::Base
  attr_accessible :response_text
  
  has_one :poll_author, :through => :question
  belongs_to :question
  has_many :responses
end
