class Response < ActiveRecord::Base
  attr_accessible :answer_choice_id, :respondent_id
  
  belongs_to :answer_choice
  has_one :poll_author, :through => :answer_choice
  has_one :question, :through => :answer_choice
  # will infer `foreign_key => :respondent_id`
  belongs_to :respondent, :class_name => "User"
  
  validates :answer_choice, :respondent, :presence => true
  validate :respondent_has_not_already_answered_question
  validate :respondent_is_not_poll_author
  
  private
  def respondent_is_not_poll_author
    if self.poll_author.id == self.respondent_id
      errors[:respondent_id] << "cannot be poll author"
    end
  end
  
  def respondent_has_not_already_answered_question
    duplicate_responses = self
      .question
      .responses
      .where("responses.respondent_id = ?", self.respondent_id)

    if persisted?
      duplicate_responses =
        duplicate_responses.where("responses.id != ?", self.id)
    end
    
    unless duplicate_responses.empty?
      errors[:respondent_id] << "cannot vote twice for question"
    end
  end
end
