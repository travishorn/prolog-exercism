% Convert a number into a string that contains raindrop sounds corresponding to
% certain potential factors.
%
% If a given number...
% - has 3 as a factor, add 'Pling' to the result.
% - has 5 as a factor, add 'Plang' to the result.
% - has 7 as a factor, add 'Plong' to the result.
% - does not have any of 3, 5, or 7 as a factor, return a string containing the
%   given number.
convert(N, Sounds) :-
  % If the remainder of N/3 is 0, 3 is a factor, add "Pling"
  (N mod 3 =:= 0 -> Pling = "Pling" ; Pling = ""),

  % If the remainder of N/5 is 0, 5 is a factor, add "Plang"
  (N mod 5 =:= 0 -> Plang = "Plang" ; Plang = ""),

  % If the remainder of N/7 is 0, 7 is a factor, add "Plong"
  (N mod 7 =:= 0 -> Plong = "Plong" ; Plong = ""),

  % Check to see if Pling, Plang, and Plong are all empty
  (Pling = "" , Plang = "" , Plong = "" ->

    % They are, return the given number, as a string
    atom_string(N, Sounds) ;

      % At least one has a value, concatenate them into a single string. We call
      % `string_concat/3` twice because we can only concatentate 2 strings at a
      % time.
      string_concat(Pling, Plang, TmpSounds),
      string_concat(TmpSounds, Plong, Sounds)
  ).
