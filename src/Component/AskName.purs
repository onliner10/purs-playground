module Component.AskName where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

-- This component can notify parent components of one event, `Clicked`
data Output = NameChanged String

type State = { currentName :: String}

-- This component can handle one internal event, `Click`
data Action = SubmitClicked | NameInputChanged String

component :: forall query input m. H.Component query input Output m
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

  handleAction :: Action -> H.HalogenM State Action () Output m Unit
  handleAction = case _ of
    NameInputChanged x ->  H.modify_ \_ -> { currentName : x}
    SubmitClicked -> do
      { currentName } <- H.get
      H.raise $ NameChanged currentName

  render :: State -> H.ComponentHTML Action () m
  render _ = HH.div_
    [ HH.label_ [HH.text "Name"]
    , HH.input [HP.type_ HP.InputText, HE.onValueChange NameInputChanged]
    , HH.button [HE.onClick \_ -> SubmitClicked] [HH.text "Ok"]
    ]