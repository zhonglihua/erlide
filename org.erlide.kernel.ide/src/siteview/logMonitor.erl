-module (logMonitor).
-compile(export_all).
-include("../../include/object.hrl").
-include("../../include/monitor.hrl").

extends () -> atomic_monitor .

?SUPERCLAUSE(action).
?SUPERCLAUSE(event).
?SUPERCLAUSE(pattern).

logMonitor(Self, Name)->
	?SETVALUE(machine,[]),
	?SETVALUE(pLogFile,[]),
	?SETVALUE(pResetFile,"Never"),
	?SETVALUE(pAlerting,"for each log entry matched"),
	?SETVALUE(pMatch,[]),
	?SETVALUE(pRulesFile,[]),
	?SETVALUE(pValueLabels,[]),
	?SETVALUE(pNoFileCheckExist,[]),

	?SETVALUE(name,Name),
	object:super(Self, [Name]).

logMonitor_(Self)->eresye:stop(?VALUE(name)).

init(Self,EventType,Pattern,State) ->
	object:do(Self,waiting).

get_max() -> 10.  %max number of this type of monitor can be run in parallel

do_pong(Self,EventType,Pattern,State) ->
	object:do(Self,start).

update(Self,EventType,Pattern,State) ->
  	Start = erlang:now(),
	object:do(Self,running),


%% 	simulated random data
	?SETVALUE(pLines,[]),
	?SETVALUE(pMatches,[]),
	?SETVALUE(pLastAlertsPerMinute,[]),
	?SETVALUE(pLastLinesPerMinute,[]),

	Diff = timer:now_diff(erlang:now(), Start)/1000000,
	?SETVALUE(?MEASUREMENTTIME,Diff),
	?SETVALUE(?LASTUPDATE,erlang:now()),


	resource_pool:release(?VALUE(name)), %%trigging the release_resource_pattern in resource_pool module
	object:super(Self, post_updating,[]),	
	object:do(Self,logging).

start(Name) ->
	case object:get_by_name(Name) of
		[] -> 
				X = object:new(?MODULE,[Name]),
				object:start(X),
				eresye:assert(Name,{wakeup}),
				X;
		_ -> atom_to_list(Name) ++ " already existed, choose a new name"
	end.
