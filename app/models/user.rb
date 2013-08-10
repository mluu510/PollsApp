class User < ActiveRecord::Base
  attr_accessible :user_name
  
  has_many :polls, :foreign_key => "author_id"
  has_many :responses, :foreign_key => "respondent_id"
end
