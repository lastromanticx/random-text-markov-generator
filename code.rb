def f(s,n)
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

def g(s,order,length)
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
