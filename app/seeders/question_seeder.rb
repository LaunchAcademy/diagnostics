class QuestionSeeder
  attr_reader :questions_data

  def initialize(yaml_file)
    @yaml_file = yaml_file
    load_questions
  end

  def seed!
    questions_data["questions"].each do |question_data|
      question = Question.find_or_create_by(query: question_data["question"])

      question_data["answers"].each do |answer|
        content = nil
        correct = nil
        if content = answer["correct_answer"]
          correct = true
        elsif content = answer["wrong_answer"]
          correct = false
        end

        answer = Answer.find_or_create_by(content: content)
        answer.save!
      end
    end
  end

  private
  def load_questions
    File.open(@yaml_file, "r") do |file|
      @questions_data = YAML.load(file)
    end
  end
end
