% Merl
% Copyright (c) 2016 Seyed Razavi
% See MIT-LICENSE for licensing information.

-module(merl_protocol).
-behaviour(ranch_protocol).

-export([start_link/4]).
-export([init/4]).

-type opts() :: [].
-export_type([opts/0]).

-define(TIMEOUT, infinity).
-define(WORKFACTOR, 12).

-record(state, {
	step,
	player,
	socket :: inet:socket(),
	transport :: module()
}).

%% @doc starts the listeners
start_link(Ref, Socket, Transport, Opts) ->
	Pid = spawn_link(?MODULE, init, [Ref, Socket, Transport, Opts]),
	{ok, Pid}.

%% @doc initialises the protocol
-spec init(ranch:ref(), inet:socket(), module(), opts()) -> ok.
init(Ref, Socket, Transport, _Opts) ->
	ok = ranch:accept_ack(Ref),
	Transport:send(Socket, "**** Merl ****\r\n"),
	Transport:send(Socket, "What's your name, friend? "),
	loop(new_state(login, Socket, Transport)).

%% @doc Loops through the state
loop(State=#state{step=Step, player=Player,socket=Socket,transport=Transport}) ->
	case Transport:recv(State#state.socket, 0, ?TIMEOUT) of
		{ok, Data} ->
			if Step == login ->
				Name = strip_string(Data),
				Transport:send(Socket, ["\r\nWelcome to Merl ",Name,"!\r\n> "]),
				loop(new_state(echo, Socket, Transport, #{name => Name}));
			true ->
				lager:info("echoing ~p", [Data]),
	            Transport:send(Socket, Data),
	            Transport:send(Socket, "\r\n> "),
	            loop(new_state(echo, Socket, Transport, Player))
	        end;
        _ ->
            ok = Transport:close(Socket)
	end.

new_state(Step, Socket, Transport) ->
	#state{step=Step, socket=Socket, transport=Transport}.

new_state(Step, Socket, Transport, Player) ->
	#state{step=Step, player=Player, socket=Socket, transport=Transport}.

strip_string(Bin) when is_binary(Bin) ->
	strip_string(binary_to_list(Bin));
strip_string(Str) when is_list(Str) ->
	re:replace(Str, "(^\\s+)|(\\s+$)", "", [global,{return,list}]).