module Component.Footer (component) where

import Halogen as H
import Halogen.HTML as HH

type FooterInput = { name :: String }

type FooterState = { name :: String }

component :: forall query output m. H.Component query FooterInput output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval
    }
  where
  initialState :: FooterInput -> FooterState
  initialState { name } = { name }
  render :: forall action. FooterState -> H.ComponentHTML action () m
  render {name} = HH.h1 [] [HH.text "witam ", HH.text name]