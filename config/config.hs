
data ConfigInfo = ConfigInfo { path :: String
                             , fileName :: String
                             }

readConfig :: String -> IO ConfigInfo
readConfig f = do
   rv <- runErrorT $ do

      -- open the configuration file
      cp <- join $ liftIO $ readfile emptyCP f
      let x = cp

      -- read out the attributes
      pv <- get x "Location" "path"
      fv <- get x "Location" "filename"

      -- build the config value
      return (ConfigInfo { path = pv
                         , fileName = fv
                         })

   -- in the instance that configuration reading failed we'll
   -- fail the application here, otherwise send out the config
   -- value that we've built
   either (\x -> error (snd x)) (\x -> return x) rv

main :: IO ()
main = do
   config <- readConfig "test.cfg"
   putStrLn $ "The path value is: " ++ (path config)
   putStrLn $ "The filename value is: " ++ (fileName config)


