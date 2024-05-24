module Component.Footer (component) where

import Data.Maybe
import Prelude
import Halogen as H
import Halogen.HTML as HH

data FooterAction = Receive FooterInput

type FooterInput = { name :: String }

type FooterState = { name :: String }

component :: forall query output m. H.Component query FooterInput output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval
        { handleAction = handleAction
        , receive = Just <<< Receive
        }
    }
  where
  initialState :: FooterInput -> FooterState
  initialState { name } = { name }
  render :: forall action. FooterState -> H.ComponentHTML action () m
  render {name} = HH.h1 [] [HH.text "witam ", HH.text name]
  handleAction :: FooterAction -> H.HalogenM FooterState FooterAction () output m Unit
  handleAction = case _ of
    -- When we receive new input we update our `label` field in state.
    Receive input ->
    -- equivalent to
    --   H.modify_ $ \x -> x { name = input.name }
      H.modify_ _ { name = input.name }