-module(some_app).
-author('Yura Zhloba <yzh44yzh@gmail.com>').

-behaviour(application).
-export([start/0, start/2, stop/1]).
-include("logger.hrl").

start() ->
    ssl:start(),
    application:start(some),
    ok.


start(_StartType, _StartArgs) ->
    some_sup:start_link().

    
stop(_State) ->
    ok.
