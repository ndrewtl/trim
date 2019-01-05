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

main = trim =<< execParser opts
  where
    opts = info (options <**> helper)
      (  fullDesc
      <> progDesc "Trim whitespace from files"
      <> header   "trim - remove trailing whitespace" )

trimOperation :: [String] -> Options -> [String]
trimOperation inputLines opts =
  let trimmed = map trimSpaces inputLines
  in if newlines opts then trimLines trimmed else trimmed

trim :: Options -> IO ()
trim opts = do
  inputLines <- fmap lines getContents
  putStr $ unlines $ trimOperation inputLines opts
