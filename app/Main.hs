module Main where

import Text.Trim
import System.IO

quote :: String -> String
quote str = "\"" ++ str ++ "\""

main :: IO ()
main = do
  line <- getLine
  putStrLn $ (quote . trimSpaces) line
  done <- hIsEOF stdin
  if done then pure () else main
