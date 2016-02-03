% Merl
% Copyright (c) 2016 Seyed Razavi
% See MIT-LICENSE for licensing information.

-module(merl_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

%% @doc starts superviser
start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% @doc initialises the supervisor
init([]) ->
	Procs = [
		#{
			id => merl_server,
			start => {merl_server, start_link, []},
			restart => permanent,
			shutdown => brutal_kill,
	        type => worker,
	        modules => [merl_server]
		}],
	{ok, {{one_for_one, 1, 5}, Procs}}.
