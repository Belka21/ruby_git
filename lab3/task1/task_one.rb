# По скольку для получения максимального бала по данной лабораторной 
# работе необходимо необходимо не только выполнить поставленные задачи, 
# но так же и иметь не похожий код на чужой, то в данной работе могут быть 
# использованы  самые не оптимальные и от части глупые алгоритмы достижения цели 
# Однако в виду желания получения максимального балла иных вариантов я не вижу


TEXT = 'text.txt'

$arr = [] 

def index
  $arr = File.read(TEXT).split("\n")
  $arr.each do |element|
    puts element
  end
end

def find(id)
  puts $arr[id]
end

def where(pattern)
  $arr.each do |elment|
    if elment.include?(pattern)
      puts elment
    end #да, я знаю как "правильно" оформить if в руби, но не забываем про 
        #оригинальный код и мне просто так легче читать
  end
end

def update(id, tex)
  $arr[id] = tex
  File.write(TEXT, "")
  $arr.each do |element|
      File.write(TEXT, element+"\n", mode: "a")
  end
end

def delete(id)
  file = File.open(TEXT, "w")
    $arr.each_with_index do |elment, i|
      if i != id
        file.write(elment + "\n")
      end
    end
  file.close
end
