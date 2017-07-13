require_relative 'testio'
require_relative 'resprinter'

questions_file_name = "#{File.dirname(__FILE__)}/data/questions.txt"
results_file_name = "#{File.dirname(__FILE__)}/data/results.txt"

name = ARGV[0]

if name == nil
  name = "Человек"
end

puts "Добрый день, #{name}! Предлагаем определить Ваш уровень коммуникабельности.\n" \
  "Для этого Вам нужно правдиво ответить на несколько вопросов.\n\n"

io = TestIO.new(questions_file_name)
resprinter = ResPrinter.new(results_file_name)

until io.test_is_finished?
  io.ask_question
end

puts "\n#{name},"
puts "\nВаш результат теста: #{io.points} баллов."
puts resprinter.print_res(io.points)
