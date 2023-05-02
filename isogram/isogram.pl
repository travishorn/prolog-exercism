% Load the module for Perl compatible regular expression matching
:- use_module(library(pcre)).

% Determine if a word or phrase is an isogram
isogram(Word) :-

  % Convert the word to all uppercase letters
  string_upper(Word, UppercaseWord),

  % Remove any character that is not an uppercase letter
  re_replace("[^A-Z]"/g, "", UppercaseWord, CleanWord),

  % Split the word into a list of uppercase letters
  atom_chars(CleanWord, Letters),

  % Sort the letters. **This predicate also removes duplicates.**
  sort(Letters, SortedLetters),

  % Bind the number of letters in the de-duplicated list to NumLetters
  length(SortedLetters, NumLetters),

  % Check the number of letters in the original list against NumLetters. If it
  % is equivalent, isogram/1 is true.
  length(Letters, NumLetters).
