class TestIO
  def initialize
    @questions = [
      "Переживаете ли вы в ожидании важной деловой встречи?",
      "Если вам поручат выступить с докладом на каком либо мероприятии," \
        " вызовет ли это у вас чувство дискомфорта?",
      "Вы откладываете поход к врачу до последнего момента?",
      "Если вам предстоит командировка в незнакомый город, постараетесь" \
        " ли вы избежать этой командировки?",
      "Вы делитесь своими мыслями и чувствами с кем бы то ни было?",
      "Вас раздражает, когда незнакомые люди на улице обращаются к вам с вопросом?",
      "Вы думаете, что людям разных поколений действительно трудно понимать друг друга?",
      "Вам сложно будет сказать человеку, чтобы он вернул вам деньги, взятые" \
        " у вас несколько месяцев назад?",
      "Вам подали некачественное блюдо в кафе. Промолчите ли вы?",
      "Вы заговорите с незнакомым человеком, оставшись с ним наедине?",
      "Обнаружив в кассе, магазине, библиотеке длинную очередь, вы встанете в нее?",
      "Вам неприятно быть судьей в чужих конфликтах?",
      "Вы всегда оцениваете произведения искусства на свой вкус, не прислушиваясь" \
        " к чужому мнению? ",
      "Если кто то выскажет ошибочную точку зрения на хорошо известный вам вопрос," \
        " вы предпочтете промолчать и не исправлять его?",
      "Просьбы помочь в учебе или работе раздражают вас?",
      "Вам проще изложить свое мнение на бумаге, чем рассказать о нем?"
    ]
    @points = 0
    @current_q = 0
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
    STDOUT.puts @questions[@current_q]
    @current_q += 1
    user_input = input_choice
    count_points(user_input)
  end

  def test_is_finished?
    @current_q >= @questions.size
  end

  def points
    @points
  end
end