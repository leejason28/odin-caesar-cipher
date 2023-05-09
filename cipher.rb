# takes a string and returns its characters shifted by sf places in the alphabet 
def caesar_cipher(string, sf)
  # the string #ord method converts first character of string to integer ordinal
  # 'a'=97, 'z'=122, 'A'=65, 'Z'=90
  string_array = []
  string.each_char { |char| string_array.push(char.ord) }
  
  string_array.map! { |char| shift(char, sf) }

  string_array.map! { |char| char.chr }

  string_array.join
end

def is_alpha(ord)
  return true if is_lower(ord) || is_upper(ord)
  false
end

def is_lower(ord)
  return true if ord>=97 && ord<=122
  false
end

def is_upper(ord)
  return true if ord>=65 && ord<=90
  false
end

def shift(ord, sf)
  if is_alpha(ord)
    num = ord+sf
    if (num>122 && is_lower(ord)) || (num>90 && is_upper(ord))
      return num-26
    end
    return num
  end
  return ord
end