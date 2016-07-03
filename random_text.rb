class RTMG
  def initialize
    while true
      puts "Enter file path or 'p:' followed by pasted text:"
      path = gets.strip.split(/p:/i)
      if path[0].downcase == "exit" then break end

      puts "\nEnter order:"
      order = gets.strip
      if order.downcase == "exit" then break end

      puts "\nEnter length:"
      length = gets.strip
      if length.downcase == "exit" then break end

      text = if path[1] then path[1] else File.open(path[0]).read end
      puts generate text, order.to_i, length.to_i
    end

    puts "Goodbye."
  end

  def f s,n
    h = {}
    
    i = 0 
    j = n - 1
    
    while j < s.length - 1
      w = s[i..j]
      
      if h[w]
        h[w] << s[j+1]
      else
        h[w] = [s[j+1]]
      end
      
      i += 1
      j += 1
    end
    
    h
  end

  def generate(s,order,length)
    h = f(s,order)
    start = h.max_by{|k,v| v.length}
    result = start[0] + start[1].sample

    i = 1
    j = order
    
    while j < length
      current = result[i..j]
      
      if h[current]
        next_letter = h[current].sample 
      else 
        next_letter = h.values.flatten.sample
      end
    
      result += next_letter
      i += 1
      j += 1
    end
    
    result
  end
end

g = RTMG.new
