{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment ( getEnv )
import Network.HTTP.Types (status200)
import Network.Wai ( responseLBS, Application )
import Network.Wai.Handler.Warp (run)
import Control.Exception (bracket_)

app :: Application
app req respond = bracket_
    (putStrLn "Allocating scarce resource")
    (putStrLn "Cleaning up")
    (respond $ responseLBS status200 [] "Hello World")

main :: IO ()
main = do
  port <- getEnv "PORT"
  run (fromIntegral $ read port) app