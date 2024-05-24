module Page.Home
  ( component
  )
  where

import Prelude

import Component.AskName as AskName
import Component.Footer as Footer
import Halogen as H
import Halogen.HTML as HH
import Type.Proxy (Proxy(..))

type Slots = ( askName :: forall query. H.Slot query Void Int )
_askName = Proxy :: Proxy "askName"

component :: forall query input output m. H.Component query input output m
component =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval H.defaultEval
    }
  where
  render :: forall state action. state -> H.ComponentHTML action Slots m
  render _ = HH.div_ 
    [ HH.slot_ _askName 0 AskName.component unit
    , Footer.component
    ]