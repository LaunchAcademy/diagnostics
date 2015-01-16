class QuestionSeeder
  attr_reader :questions_data

  def initialize(yaml_file)
    @yaml_file = yaml_file
    load_questions_data
  end

  def seed!
    questions_data.each do |query, answers_data|
      question = Question.find_or_create_by!(query: query)

      answers_data.each do |content|
        answer = Answer.find_or_create_by!(content: content)

        qa_params = {
          question: question,
          answer: answer,
          correct: answer == answers_data.first
        }
        question_answer = QuestionAnswer.find_or_create_by!(qa_params)
      end
    end
  end

  private
  def load_questions_data
    File.open(@yaml_file, "r") do |file|
      @questions_data = YAML.load(file)
    end
  end
end
