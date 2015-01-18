questions_yaml = "#{Rails.root}/lib/assets/questions.yml"
QuestionsSeeder.new(questions_yaml).seed!
