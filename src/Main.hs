module Main where

import Options.Applicative
import Text.Trim
import System.IO

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
    if null outdest
      then putStr str
      else error $ "Should write to file: " ++ outdest ++ ", behavior not yet implemented"

-- This method is analogous to the 'main' method of most programs.
-- Given options as input, output an IO action
run :: Options -> IO ()
run opts = do
  inputLines <- fmap lines getContents
  let output = unlines $ trim inputLines opts
    in write output opts
