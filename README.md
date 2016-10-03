# Ewc

`ewc` is a new implementation of UNIX command of `wc` by Elixir.

This is practice project, so it's very slow!

## Result

```bash
$ time ./bench.sh wc ./mix.exs 10
        0.04 real         0.01 user         0.02 sys
$ time ./bench.sh ./ewc ./mix.exs 10
        2.28 real         1.97 user         1.17 sys # :(
```

ref: [Go 言語で wc を実装してみた](http://takatoshiono.hatenablog.com/entry/2016/09/22/024605)
