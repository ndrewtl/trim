-- Tests for trim

import Test.Hspec
import Text.Trim

main :: IO ()
main = hspec $ do

  describe "Text.Trim.trimSpaces" $ do

    it "returns its input when the input has no trailing space" $
      let inputs = [ "hello, world!"
                   , []
                   , "One small step for man..."
                   , "The Glorious Glasgow Haskell Compilation System, version 8.6.3"
                   , "<!DOCTYPE html>"
                   , "One\nstring\nacross\nmultiple\nlines" ]
        in map trimSpaces inputs `shouldBe` inputs

    it "removes trailing spaces from a string that has them" $ do
      trimSpaces "hello "                          `shouldBe` "hello"
      trimSpaces "Space, the final frontier   "    `shouldBe` "Space, the final frontier"
      trimSpaces "String ending in newlines\n\n\n" `shouldBe` "String ending in newlines"
      trimSpaces "multiple\nlines\n"               `shouldBe` "multiple\nlines"
      trimSpaces "tabs\t"                          `shouldBe` "tabs"
      trimSpaces "bunch of whitespace\t\n\t\t "    `shouldBe` "bunch of whitespace"
