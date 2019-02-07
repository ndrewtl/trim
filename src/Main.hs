module Main where

import Options.Applicative
import Trim.CLI
import Trim.CLI.Parser

main :: IO ()
main = run =<< execParser opts
  where
    opts = info (options <**> helper)
      (  fullDesc
      <> progDesc "Trim whitespace from files"
      <> header   "trim - remove trailing whitespace" )

