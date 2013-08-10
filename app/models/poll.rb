class Poll < ActiveRecord::Base
  attr_accessible :title
  
  has_many :questions
  belongs_to :author, :class_name => "User"
  
  def results
    # Hash where keys are Questions and values are a nested Hash
    # where keys are AnswerChoices and values are counts
    answer_choice_counts = AnswerChoice
      .select("questions.id AS question_id, answer_choices.*, COUNT(responses.id) AS response_count")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .joins(:question)
      .where("questions.poll_id" => self.id)
      .group("answer_choices.id")
    
    # make a Hash of it
    results = {}
    answer_choice_counts.each do |answer_choice|
      question_results = results[answer_choice.question_id]
      if question_results.nil?
        results[answer_choice.question_id] = {
          answer_choice => answer_choice.response_count
        }
      else
        question_results[answer_choice] = answer_choice.response_count
      end
    end
    
    results
  end
end
