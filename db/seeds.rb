questions_yaml = "#{Rails.root}/lib/assets/questions.yml"
QuestionSeeder.new(questions_yaml).seed!
