module Lib where

import Control.Monad (when)

import Data.Text (unpack)
import Data.Text.Encoding (decodeUtf8)
import Data.ByteString (ByteString)

import System.Environment (getArgs)

import Network.SSH.Client.LibSSH2 hiding (withSession)
import Network.SSH.Client.LibSSH2.Foreign (SftpAttributes(..))

myKnownHosts :: FilePath
myKnownHosts = "/Users/mvattersen/.ssh/known_hosts"

withSession :: (Sftp -> IO a) -> IO a
withSession = withSFTPUser myKnownHosts "test" "secret" "host.com" 22

filesSince :: Integer -> IO [FilePath]
filesSince t = withSession $ \sftp -> do
    list <- sftpListDir sftp "/magic/files"
    pure . fmap toF $ filter newFiles list

  where
    newFiles :: (ByteString, SftpAttributes) -> Bool
    newFiles (_, attrs) = saMtime attrs > fromInteger t

    toF :: (ByteString, SftpAttributes) -> String
    toF = unpack . decodeUtf8 . fst

anyFilesSince :: Integer -> IO Bool
anyFilesSince t = withSession $ \sftp -> do
    list <- sftpListDir sftp "/magic/files"
    pure (any newFiles list)
  where
    newFiles :: (ByteString, SftpAttributes) -> Bool
    newFiles (_, attrs) = saMtime attrs > fromInteger t

entry :: IO ()
entry = do
  args <- getArgs
  case args of
    [x] -> do
      any <- anyFilesSince (read x)
      when any (putStrLn "Newer files available")
    _   -> error "must give exactly one argument"

