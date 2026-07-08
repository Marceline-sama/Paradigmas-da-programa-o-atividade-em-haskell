-- ============================================
-- Questão 1 - Inverter uma lista
-- ============================================

reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- Tipo:
-- reverseList :: [a] -> [a]


-- ============================================
-- Questão 2 - Lista infinita doubles
-- [10,20,40,80,160,...]
-- ============================================

doubles :: [Integer]
doubles = 10 : map (*2) doubles


-- ============================================
-- Questão 3 - Lista infinita dollars
-- [100.0,105.0,110.25,...]
-- ============================================

dollars :: [Double]
dollars = 100 : map (*1.05) dollars


-- ============================================
-- Funções usadas na Questão 4
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

Tipos das expressões da Questão 4

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