% Load the module for Perl compatible regular expression matching
:- use_module(library(pcre)).

% Determine if a word or phrase is an isogram
isogram(Word) :-

  % Convert the word to all uppercase letters
  string_upper(Word, UppercaseWord),

  % Remove any character that is not an uppercase letter
  re_replace("[^A-Z]"/g, "", UppercaseWord, CleanWord),

  % Split the word into a list of uppercase letters
  string_chars(CleanWord, Letters),

  % Returns true if Letters is a set (a proper list without duplicates)
  is_set(Letters).
