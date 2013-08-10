class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id, :null => false
      t.integer :respondent_id, :null => false

      t.timestamps
    end
    
    add_index :responses, :answer_choice_id
    add_index :responses, :respondent_id
    
    # NB: won't work; what if user tries to submit different answers to same
    # question?
    # create_index :polls, [:user_id, :answer_choice_id], :unique => true
  end
end
