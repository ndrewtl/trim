module Main where

import Options.Applicative
import Trim.CLI
import Trim.CLI.Parser

main :: IO ()
main = getOpts >>= run
