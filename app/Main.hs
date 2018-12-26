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
    <> help  "If enabled, also trim trailing newlines" )
  <*> strOption
    ( long  "output"
    <> short 'o'
    <> value ""
    <> help  "File to direct output" )

main = trim =<< execParser opts
  where
    opts = info (options <**> helper)
      (  fullDesc
      <> progDesc "Trim whitespace from files"
      <> header   "trim - remove trailing whitespace" )

trim :: Options -> IO ()
trim opts = do
  inputLines <- fmap lines getContents
  putStr $ unlines $ trimLines $ map trimSpaces inputLines
