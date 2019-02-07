module Trim.CLI.Parser (Options(..), options) where

import Options.Applicative

data Options = Options
  { newlines :: Bool
  , output   :: Maybe FilePath
  , input    :: FilePath }

options :: Parser Options
options =  Options
  <$> switch
    (  long  "newlines"
    <> short 'N'
    <> help  "If enabled, trim trailing newlines" )
  <*> optional (strOption
      (  long  "output"
      <> short 'o'
      <> help  "File to direct output" ))
  <*> argument str
    (  metavar "FILE"
    <> value "-" )

