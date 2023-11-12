{-# LANGUAGE OverloadedStrings #-}
import Test.Hspec
import PandocProjectRelativeLinks
import Text.Pandoc
import Data.Text (Text)

main = hspec $ do
  describe "considerAsProjectRelative" $ do
    it "shouldn't with relative links like foo/bar" $ do
      considerAsProjectRelative "foo/bar" `shouldBe` False
    it "shouldn't with relative links like ./me" $ do
      considerAsProjectRelative "./me" `shouldBe` False
    it "shouldn't with URLS like http://foo.bar" $ do
      considerAsProjectRelative "http://foo.bar" `shouldBe` False
    it "shouldn't with fragment ids like #look" $ do
      considerAsProjectRelative "#look" `shouldBe` False
    it "should with a link like /do/it" $ do
      considerAsProjectRelative "/do/it" `shouldBe` True

  describe "adjustLinks" $ do
    it "should adjust a project relative link" $ do
      adjustLink ".." (Link nullAttr [] ("/url", "title"))
        `shouldBe` (Link nullAttr [] ("../url", "title"))
    it "should adjust a project relative image link" $ do
      adjustLink ".." (Image nullAttr [] ("/img", "title"))
        `shouldBe` (Image nullAttr [] ("../img", "title"))
    it "should leave any other elements unchanged" $ do
      pendingWith "takes too much time to setup for now"
