quizzes = Dir[Rails.root.join("lib/assets/quizzes/*.yml")]
quizzes.each { |q| QuizzesSeeder.new(q).seed! }
