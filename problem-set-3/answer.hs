import qualified Data.Set as S

data Foo = Foo { left :: S.Set Foo, right :: S.Set Foo}
           deriving (Show)

instance Ord Foo where
  lhs <= rhs = ((S.lookupGT rhs (left lhs)) == Nothing) && ((S.lookupLE lhs (right rhs)) == Nothing)

instance Eq Foo where
  lhs == rhs = (lhs <= rhs) && (lhs <= rhs)

instance Num Foo where
  (+) lhs rhs = Foo (S.union (S.map (+ rhs) (left lhs)) (S.map (+ lhs) (left rhs))) (S.union (S.map (+ rhs) (right lhs)) (S.map (+ lhs) (right rhs)))
