-module(ep_example_printable).

-def_ep({printable, #{to_string => my_to_string/1}}).

my_to_string(V) when is_integer(V) -> integer_to_binary(V);
my_to_string(V) when is_float(V) -> float_to_binary(V);
my_to_string(V) when is_atom(V) -> atom_to_binary(V, utf8).
