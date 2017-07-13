require_relative 'test_io'
require_relative 'resprinter'

name = ARGV[0]

if name == nil
  name = "Человек"
end

puts "Добрый день, #{name}! Предлагаем определить Ваш уровень коммуникабельности.\n" \
  "Для этого Вам нужно правдиво ответить на несколько вопросов.\n\n"

io = TestIO.new
resprinter = ResPrinter.new

until io.test_is_finished?
  io.ask_question
end

puts "\n#{name},"
puts "\nВаш результат теста: #{io.points} баллов."
puts resprinter.print_res(io.points)
