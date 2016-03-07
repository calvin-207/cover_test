%%%-------------------------------------------------------------------
%%% @author lizhuobin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 二月 2016 15:54
%%%-------------------------------------------------------------------
-module(cover_test).
-author("lizhuobin").

%% API
-export([start/0]).

start() ->
	Res = cover:compile_beam_directory("ebin"),
	lists:foreach(
		fun({Type, Mod}) ->
			case Type of
				ok ->
					ok;
				_ ->
					io:fread("error cover compile ~w error, please check!!", [Mod]),
					exit(compile_error)
			end
		end, Res),
	cover:start(),
	ok = application:start(cover_test).
