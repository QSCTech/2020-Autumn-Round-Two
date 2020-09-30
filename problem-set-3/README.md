## Problem set 3 - All About Monads

众所周知，`Haskell` 是一门函数式编程语言。

而不众所周知的是，很久很久以前有一种数叫做 Foo，它满足下列性质：
- 每个 Foo 可以写作 $X = \{A|B\}$，其中 $A$ 和 $B$ 是两个 Foo 的集合（在代码中考虑 A 与 B 是有限集的情况即可）。我们称 $A$ 为左集，$B$ 为右集，分别记为 $L(X) = A, R(X) = B$
- 所谓 $X = \{A|B\}$ 小于等于 $Y = \{C|D\}$，是指 $A$ 中不存在元素使 $Y$ 小于等于它，且 $D$ 中不存在元素小于等于 $X$
- 而加法 $X + Y = Z$ 的定义是
  $$
  L(Z) = \{ u + Y | u \isin L(X) \} \cup \{ X + v | v \isin L(Y) \} \\
  R(Z) = \{ u + Y | u \isin R(X) \} \cup \{ X + v | v \isin R(Y) \}
  $$

我们希望你能自学一小部分 `Haskell`（比如通过 [Real World Haskell 中文版](http://cnhaskell.com/)），来实现这个代数类型（只需完成类型定义及加法即可）

为了完成这道题，你可能需要使用 `Data.Set` 中的 [notMember](http://hackage.haskell.org/package/containers-0.6.3.1/docs/Data-Set.html#g:6), [map](http://hackage.haskell.org/package/containers-0.6.3.1/docs/Data-Set.html#g:10) 和 [union](http://hackage.haskell.org/package/containers-0.6.3.1/docs/Data-Set.html#g:7) 函数

在 [sample.hs](./sample.hs) 中我们给出了一段样例代码，它不完整地实现了一个复数类型（只实现了类型定义、部分自定义的比较函数和加法）。你可以把它贴到 [repl.it](https://repl.it/languages/haskell) 上（当然，你本机下载安装 [ghc](https://www.haskell.org/ghc/) 更好），然后在右侧的 ghci 中输入以下命令来验证这段代码的正确性：
```
> :load main.hs
> let a = Complex 2 4
> let b = Complex (-1) 3
> a <= b
> b <= a
> a + b
```

当然了，你完不成这项任务也绝对不会影响你的面试分数。我们只是希望能在二面的时候和你聊聊你自学期间的感受与体会
