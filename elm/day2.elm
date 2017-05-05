import Graphics.Element exposing(..)  
import Graphics.Collage exposing(..)  
import Color exposing(..)  
import Signal exposing(..)
import Signal as Signal
import Keyboard
import Mouse
import Window
import String
import Graphics.Input as Input 
import Graphics.Input.Field as F
import Text exposing(..)  


main =
  map2 asTx Mouse.position Mouse.isDown

asTx p d =
  let a = toString (fst p)
      b = toString (snd p)
      c = if d then " Mouse is down." else " Mouse is up."
   in show ("Mouse is at: (" ++ a ++ ", " ++ b ++ ")" ++ c)



main = yOnClick

yOnClick =
  Signal.map show (Signal.sampleOn Mouse.clicks Mouse.y)


