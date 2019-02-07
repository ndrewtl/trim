module Trim.CLI.IO (readInput, writeOutput) where

import System.IO
import System.Directory
import Trim.CLI.Parser

-- This method
readInput :: Options -> IO String
readInput opts =
  let filename = input opts
  in if filename == "-"
    then getContents
    else readFile filename

-- This method writes the given string according to options
writeOutput :: String -> Options -> IO ()
writeOutput str opts =
  case output opts of
    Nothing      -> putStr str -- If no file is specified, then just print to stdout
    Just outdest -> do -- Else, write to a temp file, then move it to the destination
      (tname, thandle) <- openTempFile "." "trim"
      hPutStr thandle str
      hClose thandle
      renameFile tname outdest

