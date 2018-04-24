# ep_example

An example using [Erlang Protocols](https://github.com/marianoguerra/ep/)

For examples of protocol declarations check:

* src/ep_example_printable.erl

  + Contains example of default implementation for native types

* src/ep_example_consy.erl

  + Just protocol declaration

For examples of protocol implementations check:

* src/ep_example_tuple.erl
* src/ep_example_list.erl

## Try

```
rebar3 shell
```

### Compile-time Consolidation

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

7> printable:to_string(1).
<<"1">>

8> printable:to_string(atom).
<<"atom">>

```

### Dynamic Dispatching

We didn't add the module attributes in `src/ep_example_struct.erl` to instruct
ep to inline a clause for this data type, instead we follow the "map with magic
attribute" pattern that will try to route it dynamically as last resort.

```erlang
1> S = ep_example_struct:new(first_val, [2, 3]).
#{'__struct__' => ep_example_struct,first => first_val,
  rest => [2,3]}
2> consy:first(S).
first_val
3> consy:rest(S).
[2,3]
4> io:format("~s~n", [printable:to_string(S)]).
#ep_example_struct (first_val, [2,3])
ok
```

See `src/ep_example_list.erl` and `src/ep_example_tuple.erl` for details, but here's an example:

```erlang
-module(ep_example_list).

-ep({printable, #{to_string => my_to_string/1}}).
-ep({consy, #{first => first/1, rest => consy_rest/1}}).

my_to_string(V) when is_list(V) -> io_lib:format("#list ~p", [V]).


first(L=[H | _]) when is_list(L) -> H.
consy_rest([_ | T]) -> T.
```
