module Page.Home
  ( component
  )
  where

import Prelude

import Component.AskName as AskName
import Component.Footer as Footer
import Halogen as H
import Halogen.HTML (output)
import Halogen.HTML as HH
import Type.Proxy (Proxy(..))

type State = { currentName :: String}
data Action = HandleAskName AskName.Output

type Slots = 
  ( askName :: forall query. H.Slot query AskName.Output Int 
  , footer :: forall query. H.Slot query Void Int 
  )
_askName = Proxy :: Proxy "askName"
_footer = Proxy :: Proxy "footer"

component :: forall query input output m. H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval
      { handleAction = handleAction }
    }
  where
  initialState :: input -> State
  initialState _ = { currentName: ""}

  handleAction :: Action -> H.HalogenM State Action Slots output m Unit
  handleAction = case _ of
    HandleAskName (AskName.NameChanged x) ->
      H.modify_ \_ -> { currentName : x}

  render :: State -> H.ComponentHTML Action Slots m
  render {currentName} = HH.div_ 
    [ HH.slot _askName 0 AskName.component unit HandleAskName
    , HH.slot_ _footer 0 Footer.component { name: currentName}
    ]