-module(some_app).
-behaviour(application).

-export([start/0, start/2, stop/1]).
-include("logger.hrl").


-spec(start() -> ok).
start() ->
    lager:start(),
    application:start(some),
    ok.


-spec(start(term(), term()) -> {ok, pid()}).
start(_StartType, _StartArgs) ->
    ?INFO("start some_app"),
    some_sup:start_link().


-spec(stop(term()) -> ok).
stop(_State) ->
    ok.
