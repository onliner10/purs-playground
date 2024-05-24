module Component.AskName where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

component :: forall query input output m. H.Component query input output m
component =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval H.defaultEval
    }
  where
  render :: forall state action. state -> H.ComponentHTML action () m
  render _ = HH.div_ 
    [ HH.label_ [HH.text "Name"]
    , HH.input [HP.type_ HP.InputText]
    , HH.button [] [HH.text "Ok"]
    ]