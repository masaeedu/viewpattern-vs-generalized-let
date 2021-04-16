{-# LANGUAGE OverloadedStrings, NoMonoLocalBinds, NoMonomorphismRestriction, ViewPatterns #-}
module Lib where

import Data.String.Conversions
import Data.String (IsString (fromString))

newtype MyString = MyString String
  deriving Show
  deriving newtype Semigroup

instance ConvertibleStrings String MyString
  where
  convertString = MyString

instance IsString MyString
  where
  fromString = MyString

myStringOp :: MyString -> Int
myStringOp = const 42

test :: String -> (String, Int)
test str = (show $ mstr <> "foo", myStringOp mstr)
  where
  mstr = cs str

test2 :: String -> (String, Int)
test2 (cs -> mstr) = (show $ mstr <> "foo", myStringOp mstr)

message :: String
message = "Ready? Get set... GO!"
