data Complex = Complex { real :: Double, imag :: Double}
               deriving (Show)

instance Ord Complex where
  lhs <= rhs = ((real lhs) <= (real rhs)) && ((imag lhs) <= (imag rhs))

instance Eq Complex where
  lhs == rhs = (lhs <= rhs) && (rhs <= lhs)

instance Num Complex where
  (+) lhs rhs = Complex ((real lhs) + (real rhs)) ((imag lhs) + (imag rhs))
