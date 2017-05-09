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


-- Use map and signals to draw your own picture at the current mouse position. Change the picture when a mouse button is pressed.

import Graphics.Element exposing(..)
import Graphics.Collage exposing(..)
import Color exposing(..)
import Signal
import Text exposing(..)
import Time exposing(every, second)
import Mouse
import Window

main = 
  Signal.map3 show Window.dimensions Mouse.isDown Mouse.position

up   = filled red (circle 24)
down = filled blue (circle 44)

drawCircle : Int -> Int -> Bool -> Int -> Int -> Form
drawCircle w h d x y = 
  case d of 
    True  -> down
              |> moveX (normalizeX x w)
              |> moveY (normalizeY y h)
    False -> up
              |> moveX (normalizeX x w)
              |> moveY (normalizeY y h)

normalizeX : Int -> Int -> Float
normalizeX x w = 
  (minmax x w) - toFloat w / 2

normalizeY : Int -> Int -> Float
normalizeY y h = 
  0 - ((minmax y h) - toFloat h / 2)

minmax : Int -> Int -> Float
minmax a d = 
  if  a < 44 then 44.0
     else if a > d-44  then toFloat (d - 44) 
     else toFloat a 

show : (Int,Int) -> Bool -> (Int,Int) -> Element
show (w,h) d (x,y) = collage w h 
                [ drawCircle w h d x y ]


