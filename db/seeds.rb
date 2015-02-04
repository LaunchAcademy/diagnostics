question_sets = Dir[Rails.root.join("lib/assets/questions/*.yml")]
question_sets.each { |q| QuestionsSeeder.new(q).seed! }
