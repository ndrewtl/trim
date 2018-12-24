module Text.Trim (trimSpaces) where

import Data.Char


-- This function takes a string and trims all trailing whitespace characters from it
trimSpaces :: String -> String
trimSpaces = reverse . trimLeading . reverse
  where
    trimLeading [] = []
    trimLeading (x:xs) =
      if isSpace x then trimLeading xs else x:xs

-- This function takes a list of lines and trims all trailing lines of
-- whitespace from it
trimLines :: [String] -> [String]
trimLines = reverse . trimLeading . reverse
  where
    trimLeading [] = []
    trimLeading (x:xs) =
      if all isSpace x then trimLeading xs else x:xs
