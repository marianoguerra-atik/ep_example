-module(ep_example_list).

-ep({printable, #{to_string => my_to_string/1}}).
-ep({consy, #{first => first/1, rest => consy_rest/1}}).

my_to_string(V) when is_list(V) -> io_lib:format("#list ~p", [V]).


first(L=[H | _]) when is_list(L) -> H.
consy_rest([_ | T]) -> T.
