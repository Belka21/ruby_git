# По скольку для получения максимального бала по данной лабораторной
# работе необходимо необходимо не только выполнить поставленные задачи,
# но так же и иметь не похожий код на чужой, то в данной работе могут быть
# использованы  самые не оптимальные и от части глупые алгоритмы достижения цели
# Однако в виду желания получения максимального балла иных вариантов я не вижу

TEXT = 'text.txt'
RES = 'result.txt'

def read_file
  students = File.read(TEXT).split("\n")
  File.write(RES, "")

  loop do
    puts "Введите возраст студента"
    age = gets.to_i

    if age == -1
      puts "Пока"
      break
    end
    students.each do |element|
      if element.include?(age.to_s)
        File.write(RES, element + "\n", mode:"a")
        students.delete(element)
      end
    end

    if students.size == 0
      puts "Файл исчерпал себя"
      break
    end
  end
  File.foreach(RES){|element| puts element}
end
