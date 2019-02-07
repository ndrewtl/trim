module Trim.CLI (run) where

import Trim
import Trim.CLI.Parser
import Trim.CLI.IO

-- This method trims the given list of strings according to the options given
trim :: [String] -> Options -> [String]
trim inputLines opts =
  let trimmed = map trimSpaces inputLines
  in if newlines opts then trimLines trimmed else trimmed

-- This method is analogous to the 'main' method of most programs.
-- Given options as input, output an IO action
run :: Options -> IO ()
run opts = do
  inputLines <- fmap lines (readInput opts)
  let output = unlines $ trim inputLines opts
    in writeOutput output opts
