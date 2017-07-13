class TestIO
  attr_reader :points
  def initialize(questions_file_name)
    if File.exist?(questions_file_name)
      @questions = File.readlines(questions_file_name, encoding: 'UTF-8')
    else
      abort "[файл c вопросами не найден]"
    end
    @points = 0
    @current_q = 0
    @questions
  end

  def questions_arr
    q_arr = []
    for line in @questions do
      q_arr << line.chomp
    end
    q_arr
  end

  def input_choice
    user_input = nil
    until user_input == 1 || user_input == 2 || user_input == 3
      STDOUT.puts "Введите '1', если ответ 'Да', '2' - если 'Нет' " \
           "или 3, чтобы ответить 'Иногда' и нажмите Enter"
      user_input = STDIN.gets.to_i
    end
    user_input
  end

  def count_points(user_input)
    @points += 2 if user_input == 1
    @points += 1 if user_input == 3
  end

  def ask_question
    STDOUT.puts questions_arr[@current_q]
    @current_q += 1
    user_input = input_choice
    count_points(user_input)
  end

  def test_is_finished?
    @current_q >= questions_arr.size
  end
end
