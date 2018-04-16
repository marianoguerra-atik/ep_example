ep_example
==========

An example using [Erlang Protocols](https://github.com/marianoguerra/ep/)

Try
---

```
rebar3 shell
```

```erlang
1> consy:first([1, 2, 3]).
1

2> consy:rest([1, 2, 3]).
[2,3]

3> consy:first({1, {2, 3}}).
1

4> consy:rest({1, {2, 3}}).
{2,3}

5> io:format("~s~n", [printable:to_string([1, 2, 3])]).
#list [1,2,3]
ok

6> io:format("~s~n", [printable:to_string({1, 2, 3})]).
#tuple {1,2,3}
ok
```
