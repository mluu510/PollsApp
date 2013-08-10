class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :poll_id, :null => false
      t.string :prompt, :null => false

      t.timestamps
    end
    
    add_index :questions, :poll_id
    add_index :questions, [:poll_id, :prompt], :unique => true
  end
end
