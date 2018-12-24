module Main where

import Text.Trim
import System.IO

quote :: String -> String
quote str = "\"" ++ str ++ "\""

main :: IO ()
main = do
  lines <- fmap lines getContents
  putStr $ unlines $ trimLines $ map trimSpaces lines
