class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text

  validates :poll_id, :text, :presence => true

  has_many :answer_choices
  belongs_to :poll

  has_one :poll_author, :through => :poll, :source => :author
  has_many :responses, :through => :answer_choices
end
