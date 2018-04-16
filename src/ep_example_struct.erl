-module(ep_example_struct).
-export([new/2]).

% Here we won't declare the protocol implementations to avoid ep adding
% a clause for this, we will do it manually to try dynamic routing
-export([consy@first/1, consy@rest/1, printable@to_string/1]).

new(First, Rest) ->
    #{'__struct__' => ?MODULE, first => First, rest => Rest}.

consy@first(#{first := First}) -> First.

consy@rest(#{rest := Rest}) -> Rest.

printable@to_string(#{first := First, rest := Rest}) ->
    io_lib:format("#ep_example_struct (~p, ~p)", [First, Rest]).
