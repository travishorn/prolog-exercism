% Load the module for Perl compatible regular expression matching
:- use_module(library(pcre)).

% Convert a phrase to its acronym
abbreviate(Sentence, Acronym) :-
  % Replace all non- alphanumeric, whitespace, and hyphen characters with
  % nothing
  re_replace("[^a-zA-Z0-9\s-]"/g, "", Sentence, CleanSentence),

  % Split the sentence into words on space and hyphen. Multiple spaces and
  % hyphens are counted as a single separator
  split_string(CleanSentence, " -", " -", Words),

  % Map over the words with the first_letter/2 function defined below, getting
  % the first letter in each word
  maplist(first_letter, Words, FirstLetters),

  % Join the list of first letters into a single string
  string_chars(LowercaseAcronym, FirstLetters),

  % Convert the string to uppercase
  string_upper(LowercaseAcronym, Acronym).

% Get the first letter in a word
first_letter(Word, FirstLetter) :-
  % Bind the head (first letter) of the list (word) and drop the rest
  string_chars(Word, [FirstLetter|_]).
