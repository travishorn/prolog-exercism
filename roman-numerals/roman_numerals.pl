roman_numeral(1000, "M").
roman_numeral(900, "CM").
roman_numeral(500, "D").
roman_numeral(400, "CD").
roman_numeral(100, "C").
roman_numeral(90, "XC").
roman_numeral(50, "L").
roman_numeral(40, "XL").
roman_numeral(10, "X").
roman_numeral(9, "IX").
roman_numeral(5, "V").
roman_numeral(4, "IV").
roman_numeral(1, "I").

convert(0, "") :- !.

convert(N, Numeral) :-
  roman_numeral(NextN, NextNumeral),
  N >= NextN,
  NewN is N - NextN,
  !,
  convert(NewN, NewNumeral),
  string_concat(NextNumeral, NewNumeral, Numeral).
