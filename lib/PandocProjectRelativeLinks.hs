{-# LANGUAGE OverloadedStrings #-}
module PandocProjectRelativeLinks where

import Text.Pandoc
import Text.Pandoc.JSON (toJSONFilter)
import Text.Pandoc.Walk (walk)

import Data.Maybe (fromJust)
import qualified Data.Map.Lazy as Map
import Data.Text (append, isPrefixOf, Text)

-- | Predicate to select only URLs which are to be considered project
-- relative.
considerAsProjectRelative :: Text -> Bool
considerAsProjectRelative = isPrefixOf "/"

-- | Change absolute links to project relative links
adjustLink :: Text -> Inline -> Inline
adjustLink path l@(Link attrs txt (url, title))
  | considerAsProjectRelative url = Link attrs txt (append path url, title)
  | otherwise = l
adjustLink path i@(Image attrs txt (url, title))
  | considerAsProjectRelative url = Image attrs txt (append path url, title)
  | otherwise = i
adjustLink _ x = x

-- | Extract the pathToProjectRoot from the similar named meta
-- variable.
pathToProjectRoot :: Meta -> Text
pathToProjectRoot m = extractString root
  where
    meta = unMeta m
    root = fromJust (Map.lookup "pathToProjectRoot" meta)
    extractString (MetaString str) = str
    extractString (MetaInlines [Str str]) = str
    extractString _ = undefined -- TODO

filterImpl :: Pandoc -> Pandoc
filterImpl (Pandoc meta blocks) = (Pandoc meta blocks')
  where
    blocks' = walk (adjustLink (pathToProjectRoot meta)) blocks

jsonFilter :: IO ()
jsonFilter = toJSONFilter filterImpl
