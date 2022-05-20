# User string + number instructions: 
puts "Welcome to Tygh's Caesar Cipher! 
Enter a message you wish to encrypt then hit return."
userstringInput = gets.chomp
puts "Next, choose your cipher key. 
Enter number between 1-26, then hit return to finish."
usernumInput = gets.chomp.to_i #convert a string (from `gets``) to integer
# If user enters a number outside the allowed range,
# show directions and get another # until it's right
while (usernumInput > 26) || (usernumInput < 1) do
  puts "Oops, please reenter your key, a number between 1-26" 
  usernumInput = gets.chomp.to_i
end  

def caesar_cipher (string, shiftFactor)
  puts "The message -- \"#{string}\" -- will be shifted by a factor of #{shiftFactor}."
  # first, convert the user string to array
  arrayInput = string.split("")  
  # Convert each character to ASCII value:  https://ruby-doc.org/core-2.4.0/String.html#method-i-ord
  # A-Z = 65-90, a-z = 97-122: https://www.asciitable.com/
  arrayOrdinal = arrayInput.map{|char| char.ord} 
  # Logic to differentiate characters needing ciphering (letters) vs. other
  arrayShifted = arrayOrdinal.map do |ordNum| # remember, "Each always returns the original, unchanged object."
    if ordNum.between?(97, 122) # lowercase
      adjusted_index = (ordNum + shiftFactor) % 97
      shiftedOrdNum = (97..122).to_a[adjusted_index - 26] 
      shiftedOrdNum
    elsif ordNum.between?(65, 90) # uppercase
      adjusted_index = (ordNum + shiftFactor) % 65
      shiftedOrdNum = (65..90).to_a[adjusted_index - 26] 
      shiftedOrdNum
    else #no shift (keep num)
      ordNum # w/o this it added nils for non-letters
    end
  end
  # Find the corresponding letter of the ordNum (wrap from z to a.)
  shiftedArrayCharacterized = arrayShifted.map { |num| num.chr } 
  # FINALLY, output the array into a string (keep case)
  sleep(2.0) # pauses in sec before showing below for UX...
  puts messageEncrypted = 
    "Your encrypted message is: \"#{shiftedArrayCharacterized.join("")}\""  
end 

caesar_cipher(userstringInput, usernumInput)