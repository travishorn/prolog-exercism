% Coverts normal numbers to Roman Numerals.

% Map roman numerals to regular numbers
roman_numeral("M", 1000).
roman_numeral("CM", 900).
roman_numeral("D",  500).
roman_numeral("CD", 400).
roman_numeral("C",  100).
roman_numeral("XC", 90).
roman_numeral("L", 50).
roman_numeral("XL", 40).
roman_numeral("X", 10).
roman_numeral("IX", 9).
roman_numeral("V", 5).
roman_numeral("IV", 4).
roman_numeral("I", 1).

% Use Definite Clause Grammar to get a roman numeral from a regular number.
% This solution uses recursion, subtracting values until it gets to zero.

% The base case, when the value N has reached zero. There is nothing left to
% recurse. Return an empty string.
convert_dcg(0) --> "".

% This is the recursive case. The value N is not 0. 
convert_dcg(N) -->
  % Look up the largest roman numeral that is less than or equal to N
  { roman_numeral(Roman, LargestN), N >= LargestN },

  % DCG output goal. Output the roman numeral mapped to LargestN
  Roman,

  % Subtract the largest regular number found from the current N
  { NextN is N - LargestN },

  % Call `convert_dcg/1` again (recurse) with the new value
  convert_dcg(NextN).

convert(N, Numeral) :-
    % Get a list of roman numerals that correspond to N, binding it to Numerals
    phrase(convert_dcg(N), Numerals),

    % Convert the list to a string
    string_chars(Numeral, Numerals),

    % Use a cut to prevent looking for more roman numerals after one has been
    % found
    !.
