module Paths_groebner (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ikegami/Library/Haskell/bin"
libdir     = "/Users/ikegami/Library/Haskell/ghc-7.8.3-x86_64/lib/groebner-0.1.0.0"
datadir    = "/Users/ikegami/Library/Haskell/share/ghc-7.8.3-x86_64/groebner-0.1.0.0"
libexecdir = "/Users/ikegami/Library/Haskell/libexec"
sysconfdir = "/Users/ikegami/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "groebner_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "groebner_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "groebner_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "groebner_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "groebner_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
