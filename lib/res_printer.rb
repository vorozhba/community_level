class ResPrinter
  def initialize(results_file_name)
    if File.exist?(results_file_name)
      @results = File.readlines(results_file_name, encoding: 'UTF-8')
    else
      puts "[файл с ответами не найден]"
    end
    @results
  end

  def results_arr
    results_arr = []
    for line in @results do
      results_arr << line.chomp
    end
    results_arr
  end

  def print_res(points)
    case points
    when 30..32 then results_arr[0]
    when 25..29 then results_arr[1]
    when 19..24 then results_arr[2]
    when 14..18 then results_arr[3]
    when 9..13 then results_arr[4]
    when 4..8 then results_arr[5]
    else
      results_arr[6]
    end
  end
end
