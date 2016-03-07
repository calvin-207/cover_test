%%%-------------------------------------------------------------------
%%% @author lizhuobin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 二月 2016 18:58
%%%-------------------------------------------------------------------
-module(test).
-author("lizhuobin").
-compile(export_all).
%% API
-export([]).


test() ->
	cover_test_server ! {hello, {hello, world}}.