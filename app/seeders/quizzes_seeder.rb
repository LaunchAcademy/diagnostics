class QuizzesSeeder
  attr_reader :questions_data

  def initialize(yaml_file)
    @yaml_file = yaml_file
    load_questions_data
  end

  def seed!
    Rails.logger.info "Creating #{quiz_name} quiz"
    quiz = Quiz.find_or_create_by!(name: quiz_name)

    questions_data.each do |query, answers_data|
      Rails.logger.info "Creating question: #{query}"
      question = Question.find_or_create_by!(query: query)
      quiz.questions << question

      answers_data.each_with_index do |content, i|
        Rails.logger.info "Creating answer: #{content}"
        question.answers.find_or_create_by!(content: content, correct: i == 0)
      end
    end
  end

  def quiz_name
    File.basename(@yaml_file, ".yml").titleize
  end

  private

  def load_questions_data
    File.open(@yaml_file, "r") do |file|
      Rails.logger.info "Loading YAML file: #{@yaml_file}"
      @questions_data = YAML.load(file)
    end
  end
end
