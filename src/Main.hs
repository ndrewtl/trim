module Main where

import System.IO
import System.Directory
import Options.Applicative
import Text.Trim

data Options = Options
  { newlines :: Bool
  , output   :: FilePath }

options :: Parser Options
options = Options
  <$> switch
    (  long  "newlines"
    <> short 'N'
    <> help  "If enabled, trim trailing newlines" )
  <*> strOption
    ( long  "output"
    <> short 'o'
    <> value ""
    <> help  "File to direct output" )

main = run =<< execParser opts
  where
    opts = info (options <**> helper)
      (  fullDesc
      <> progDesc "Trim whitespace from files"
      <> header   "trim - remove trailing whitespace" )

-- This method trims the given list of strings according to the options given
trim :: [String] -> Options -> [String]
trim inputLines opts =
  let trimmed = map trimSpaces inputLines
  in if newlines opts then trimLines trimmed else trimmed

-- This method writes the given string according to options
write :: String -> Options -> IO ()
write str opts =
  let outdest = output opts in
    if null outdest   -- If no file is specified ...
      then putStr str -- just print to stdout
      else do         -- Else, write to a temp file, then move it to the destination
        (tname, thandle) <- openTempFile "." "trim"
        hPutStr thandle str
        hClose thandle
        renameFile tname outdest

-- This method is analogous to the 'main' method of most programs.
-- Given options as input, output an IO action
run :: Options -> IO ()
run opts = do
  inputLines <- fmap lines getContents
  let output = unlines $ trim inputLines opts
    in write output opts
