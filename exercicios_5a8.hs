{- Questão 1

Qual é o tipo de cada uma das seguintes expressões?

a) "squid" ++ "clam"

No GHCi:
:t "squid" ++ "clam"

Resultado:
[Char]

Explicação:
O operador (++) concatena listas. Como String em Haskell é
uma lista de caracteres ([Char]), o resultado possui tipo
[Char].

b) [True, False, True, True]

No GHCi:
:t [True, False, True, True]

Resultado:
[Bool]

Explicação:
Todos os elementos da lista são do tipo Bool.

c) [True, False, 'a']

No GHCi:
:t [True, False, 'a']

Resultado:
Erro de tipo.

Explicação:
Uma lista deve conter elementos do mesmo tipo.
True e False são Bool, enquanto 'a' é Char.

d) (True, False, 'a')

No GHCi:
:t (True, False, 'a')

Resultado:
(Bool, Bool, Char)

Explicação:
Como é uma tupla, ela pode armazenar elementos de tipos
diferentes.

-}

{- Questão 2

Escreva uma função em Haskell para encontrar o cubo de
um valor do tipo Double.

Tipo da função:

cube :: Double -> Double

-}

cube :: Double -> Double
cube x = x * x * x

{- A função recebe um valor do tipo Double e retorna
o cubo desse valor. -}

{- Questão 3

Escreva uma função em Haskell que receba três valores
do tipo Double e retorne a soma desses valores.

Tipo da função:

sum3 :: Double -> Double -> Double -> Double

-}

sum3 :: Double -> Double -> Double -> Double
sum3 x y z = x + y + z

{- A função recebe três valores do tipo Double e
retorna a soma desses valores. -}

{- Questão 4

Escreva uma função em Haskell para calcular o valor da
função:

f(x) = ax² + bx + c

Tipo da função:

quadratica :: Double -> Double -> Double -> Double -> Double

-}

quadratica :: Double -> Double -> Double -> Double -> Double
quadratica a b c x = a * x^2 + b * x + c

{- A função recebe os coeficientes a, b, c e o valor
de x, retornando o resultado da função quadrática. -}



-- ============================================
-- Questão 5 - Inverter uma lista
-- ============================================

reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- Tipo:
-- reverseList :: [a] -> [a]


-- ============================================
-- Questão 6 - Lista infinita doubles
-- [10,20,40,80,160,...]
-- ============================================

doubles :: [Integer]
doubles = 10 : map (*2) doubles


-- ============================================
-- Questão 7 - Lista infinita dollars
-- [100.0,105.0,110.25,...]
-- ============================================

dollars :: [Double]
dollars = 100 : map (*1.05) dollars


-- ============================================
-- Funções usadas na Questão 8
-- ============================================

my_const :: a -> b -> a
my_const x _ = x

append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

my_map :: (a -> b) -> [a] -> [b]
my_map _ [] = []
my_map f (x:xs) = f x : my_map f xs


-- ============================================
-- Exemplos para testar
-- ============================================

main :: IO ()
main = do
    putStrLn "Questao 1:"
    print (reverseList [1,2,3,4,5])

    putStrLn "\nQuestao 2:"
    print (take 10 doubles)

    putStrLn "\nQuestao 3:"
    print (take 10 dollars)

    putStrLn "\nQuestao 4:"
    print (my_const True 10)
    print (append [1,2] [3,4])
    print (append "squid" ['a','b'])
    print (my_map (my_const True) [1,2,3,4,5])

{- =========================================================

Tipos das expressões da Questão 8

my_const
    :: a -> b -> a

my_const True
    :: b -> Bool

append
    :: [a] -> [a] -> [a]

append []
    :: [a] -> [a]

append [True, False]
    :: [Bool] -> [Bool]

append [3] ['a','b']
    ERRO DE TIPO
    ([Int] e [Char] são listas de tipos diferentes)

append "squid" ['a','b']
    :: String
    Resultado: "squidab"

my_map
    :: (a -> b) -> [a] -> [b]

my_map (my_const True)
    :: [a] -> [Bool]

========================================================= -}
