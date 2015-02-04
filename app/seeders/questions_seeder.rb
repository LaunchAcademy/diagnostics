class QuestionsSeeder
  attr_reader :questions_data

  def initialize(yaml_file)
    @yaml_file = yaml_file
    load_questions_data
  end

  def seed!
    question_set = QuestionSet.find_or_create_by!(name: question_set_name)

    questions_data.each do |query, answers_data|
      question = Question.find_or_create_by!(query: query)
      question_set.questions << question

      answers_data.each_with_index do |content, i|
        question.answers.find_or_create_by!(content: content, correct: i == 0)
      end
    end
  end

  def question_set_name
    File.basename(@yaml_file, ".yml").titleize
  end

  private
  def load_questions_data
    File.open(@yaml_file, "r") do |file|
      @questions_data = YAML.load(file)
    end
  end
end
