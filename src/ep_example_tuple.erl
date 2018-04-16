-module(ep_example_tuple).

-ep({printable, #{to_string => my_to_string/1}}).
-ep({consy, #{first => first/1, rest => consy_rest/1}}).

my_to_string(V) when is_tuple(V) -> io_lib:format("#tuple ~p", [V]).


first({H, _}) -> H.
consy_rest({_, T}) -> T.
