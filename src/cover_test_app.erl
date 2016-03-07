-module(cover_test_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    {ok, _PID} = cover_test_sup:start_link(),
    cover_test_sup:start_child().

stop(_State) ->
    ok.