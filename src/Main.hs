module Main where

import Options.Applicative
import Trim.CLI
import Trim.CLI.Parser

main :: IO ()
main =  do
  opts <- getOpts
  if version opts
    then putStrLn "version string"
    else run opts
