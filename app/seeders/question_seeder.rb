class QuestionSeeder
  attr_reader :questions_data

  def initialize(yaml_file)
    @yaml_file = yaml_file
    load_questions
  end

  def seed!
    questions_data.each do |query, answers_data|
      Question.find_or_create_by(query: query)

      answers_data.each do |content|
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
