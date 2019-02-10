module Trim.CLI.Parser (Options(..), options) where

import Options.Applicative

data Options = Options
  { input    :: FilePath
  , output   :: Maybe FilePath
  , newlines :: Bool
  , version  :: Bool }

options :: Parser Options
options =  Options
  <$> argument str
    (  metavar "FILE"
    <> value "-" )
  <*> optional (strOption
      (  long  "output"
      <> short 'o'
      <> help  "File to direct output" ))
  <*> switch
    (  long  "newlines"
    <> short 'N'
    <> help  "If enabled, trim trailing newlines" )
  <*> switch
    (  long "version"
    <> short 'v'
    <> help "Show version number" )
