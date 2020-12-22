label0           = "      \n" --0

value1           = "     \t\n" --1

value2           = "    \t \n" --2

value3           = "    \t\t\n" --3

setStack         = "  "

stackTopCopy     = " \n "

stackTopSwap     = " \n\t"

stackTopthrow    = " \n\n"

add              = "\t   "

sub              = "\t  \t"

mul              = "\t  \n"

div'              = "\t \t "

mod'              = "\t \t\t"

valueToAdress    = "\t\t "

adressToStack    = "\t\t\t"

defLabel         = "\n  "

callSubr         = "\n \t"

jump             = "\n \n"

zeroJump         = "\n\t "

negJump          = "\n\t\t"

endSubr          = "\n\t\n"

fns              = "\n\n\n"

outChar          = "\t\n  "

outInt           = "\t\n \t"

inChar           = "\t\n\t "

inInt            = "\t\n\t\t"

end              = "\n\n\n"

testparse [] = []
testparse (x:xs) = case x of
    "outChar" -> testparse xs ++ outChar
    "outInt" -> testparse xs ++ outInt
    "+" -> testparse xs ++ add
    "-" -> testparse xs ++ stackTopSwap ++ sub
    "*" -> testparse xs ++ mul
    "/" -> testparse xs ++ stackTopSwap ++ div'
    "%" -> testparse xs ++ stackTopSwap ++ mod'
    x   -> testparse xs ++ setStack ++ (ts x') ++ "\n"
        where x' = read x :: Int

ts -1 = "\t\t"
ts  1 = " \t"
ts x = let x' = div x 2 in if x `mod` 2 == 0 then (ts x') ++ " " else (ts x') ++ "\t"

main :: IO ()
main = putStr $ (testparse $ words "outInt * % 10 3 4") ++ end
