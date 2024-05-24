module Component.Footer (component) where

import Halogen.HTML as HH

component :: forall i p. HH.HTML i p
component = HH.h1 [] [HH.text "witam"]