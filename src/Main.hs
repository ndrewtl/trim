module Main where

import Options.Applicative
import Trim.CLI
import Trim.CLI.Parser
import qualified Paths_trim as Meta (version)
import Data.Version (showVersion)

main :: IO ()
main =  do
  opts <- getOpts
  if version opts
    then putStrLn ("trim " ++ showVersion Meta.version)
    else run opts
