# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  ned = User.create!(:user_name => "ruggeri")
  jonathan = User.create!(:user_name => "tamboer")

  poll1 = ned.polls.create!(
    :title => "My Cats Poll"
  )
  poll2 = jonathan.polls.create!(
    :title => "A Derivative Cats Poll"
  )

  p1q1 = poll1.questions.create!(
    :prompt => "Which cat is best?"
  )

  ["Breakfast", "Earl", "Houdini"].each do |cat_name|
    p1q1.answer_choices.create!(
      :response_text => cat_name
    )
  end
end