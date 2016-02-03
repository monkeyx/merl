% Merl
% Copyright (c) 2016 Seyed Razavi
% See MIT-LICENSE for licensing information.

-module(merl_app).
-behaviour(application).
-include_lib("stdlib/include/ms_transform.hrl").
-include_lib("stdlib/include/qlc.hrl").

-export([start/2]).
-export([stop/1]).

%% @doc starts the app
start(_Type, _Args) ->
	lager:start(),
	{ok, _} = ranch:start_listener(merl, 1, ranch_tcp, [{port, 1883}],
                                                        merl_protocol, []),
	merl_sup:start_link().

%% @doc stops the app
stop(_State) ->
	ok.
