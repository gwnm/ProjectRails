require 'sinatra'

require 'sinatra/reloader' if development?



shift = 0

result = ''



def shift_char(char, shift, alphabet)

  i = alphabet.index(char)

  i -= alphabet.size if i + shift >= alphabet.size

  alphabet[i + shift]

end



def conv_to_caesar(input, shift)

  letters = input.split('')

  result = []

  letters.each do |letter|

    if ('a'..'z').include?(letter)

      shifted_char = shift_char(letter, shift, ('a'..'z').to_a)

    elsif ('A'..'Z').include?(letter)

      shifted_char = shift_char(letter, shift, ('A'..'Z').to_a)

    else

      shifted_char = letter

    end

    result << shifted_char

  end

  "Result: #{result.join}"

end



get '/' do

  input = params['input']

  shift = params['shift'].to_i

  result = conv_to_caesar(input, shift) unless input.nil?

  erb :index, :locals => {:result => result}

end