def my_reverse(input_string)
  the_string = input_string.strip.downcase.chars
  reverse_string = ""
  until the_string.length == 0
    reverse_string << the_string.pop
  end
  reverse_string
end

def is_palindrome(input_string)
  if input_string.downcase!.strip! == my_reverse(input_string)
    "#{input_string} is a palindrome :)"
  else
    "#{input_string} is not a palindrome :("
  end
end

word = "   HeLLo   "
puts my_reverse(word)
puts is_palindrome(word)

word2 = "moM    "
puts my_reverse(word2)
puts is_palindrome(word2)
