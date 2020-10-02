import qualified Data.Set as S

data Foo = Foo { left :: S.Set Foo, right :: S.Set Foo}
           -- deriving (Show)

instance Ord Foo where
  lhs <= rhs = ((S.lookupGE rhs (left lhs)) == Nothing) && ((S.lookupLE lhs (right rhs)) == Nothing)

instance Eq Foo where
  lhs == rhs = (lhs <= rhs) && (rhs <= lhs)

instance Num Foo where
  (+) lhs rhs = Foo (S.union (S.map (+ rhs) (left lhs)) (S.map (+ lhs) (left rhs))) (S.union (S.map (+ rhs) (right lhs)) (S.map (+ lhs) (right rhs)))

showSF x = if null x
           then ""
           else (show (S.findMin x)) ++ (showSF (S.deleteMin x))

instance Show Foo where
  show x = "{" ++ (showSF (left x)) ++ "|" ++ (showSF (right x)) ++ "}"