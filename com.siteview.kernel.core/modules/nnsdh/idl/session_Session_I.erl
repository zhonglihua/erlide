%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: session_Session_I
%% Source: d:/corba/idl/session.idl
%% IC vsn: 4.2.25
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module(session_Session_I).
-ic_compiled("4_2_25").


%% Interface functions
-export(['_get_associatedSession'/1, '_get_associatedSession'/2, ping/1]).
-export([ping/2, endSession/1, endSession/2]).

%% Type identification function
-export([typeID/0]).

%% Used to start server
-export([oe_create/0, oe_create_link/0, oe_create/1]).
-export([oe_create_link/1, oe_create/2, oe_create_link/2]).

%% TypeCode Functions and inheritance
-export([oe_tc/1, oe_is_a/1, oe_get_interface/0]).

%% gen server export stuff
-behaviour(gen_server).
-export([init/1, terminate/2, handle_call/3]).
-export([handle_cast/2, handle_info/2, code_change/3]).

-include_lib("orber/include/corba.hrl").


%%------------------------------------------------------------
%%
%% Object interface functions.
%%
%%------------------------------------------------------------



%%%% Operation: '_get_associatedSession'
%% 
%%   Returns: RetVal
%%
'_get_associatedSession'(OE_THIS) ->
    corba:call(OE_THIS, '_get_associatedSession', [], ?MODULE).

'_get_associatedSession'(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, '_get_associatedSession', [], ?MODULE, OE_Options).

%%%% Operation: ping
%% 
%%   Returns: RetVal
%%
ping(OE_THIS) ->
    corba:call(OE_THIS, ping, [], ?MODULE).

ping(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, ping, [], ?MODULE, OE_Options).

%%%% Operation: endSession
%% 
%%   Returns: RetVal
%%
endSession(OE_THIS) ->
    corba:cast(OE_THIS, endSession, [], ?MODULE).

endSession(OE_THIS, OE_Options) ->
    corba:cast(OE_THIS, endSession, [], ?MODULE, OE_Options).

%%------------------------------------------------------------
%%
%% Inherited Interfaces
%%
%%------------------------------------------------------------
oe_is_a("IDL:mtnm.tmforum.org/session/Session_I:1.0") -> true;
oe_is_a(_) -> false.

%%------------------------------------------------------------
%%
%% Interface TypeCode
%%
%%------------------------------------------------------------
oe_tc('_get_associatedSession') -> 
	{{tk_objref,"IDL:mtnm.tmforum.org/session/Session_I:1.0","Session_I"},
         [],[]};
oe_tc(ping) -> 
	{tk_void,[],[]};
oe_tc(endSession) -> 
	{tk_void,[],[]};
oe_tc(_) -> undefined.

oe_get_interface() -> 
	[{"endSession", oe_tc(endSession)},
	{"ping", oe_tc(ping)},
	{"_get_associatedSession", oe_tc('_get_associatedSession')}].




%%------------------------------------------------------------
%%
%% Object server implementation.
%%
%%------------------------------------------------------------


%%------------------------------------------------------------
%%
%% Function for fetching the interface type ID.
%%
%%------------------------------------------------------------

typeID() ->
    "IDL:mtnm.tmforum.org/session/Session_I:1.0".


%%------------------------------------------------------------
%%
%% Object creation functions.
%%
%%------------------------------------------------------------

oe_create() ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/session/Session_I:1.0").

oe_create_link() ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/session/Session_I:1.0").

oe_create(Env) ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/session/Session_I:1.0", Env).

oe_create_link(Env) ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/session/Session_I:1.0", Env).

oe_create(Env, RegName) ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/session/Session_I:1.0", Env, RegName).

oe_create_link(Env, RegName) ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/session/Session_I:1.0", Env, RegName).

%%------------------------------------------------------------
%%
%% Init & terminate functions.
%%
%%------------------------------------------------------------

init(Env) ->
%% Call to implementation init
    corba:handle_init(session_Session_I_impl, Env).

terminate(Reason, State) ->
    corba:handle_terminate(session_Session_I_impl, Reason, State).


%%%% Operation: '_get_associatedSession'
%% 
%%   Returns: RetVal
%%
handle_call({_, OE_Context, '_get_associatedSession', []}, _, OE_State) ->
  corba:handle_call(session_Session_I_impl, '_get_associatedSession', [], OE_State, OE_Context, false, false);

%%%% Operation: ping
%% 
%%   Returns: RetVal
%%
handle_call({_, OE_Context, ping, []}, _, OE_State) ->
  corba:handle_call(session_Session_I_impl, ping, [], OE_State, OE_Context, false, false);



%%%% Standard gen_server call handle
%%
handle_call(stop, _, State) ->
    {stop, normal, ok, State};

handle_call(_, _, State) ->
    {reply, catch corba:raise(#'BAD_OPERATION'{minor=1163001857, completion_status='COMPLETED_NO'}), State}.
%%%% Operation: endSession
%% 
%%   Returns: RetVal
%%
handle_cast({_, OE_Context, endSession, []}, OE_State) ->
    corba:handle_cast(session_Session_I_impl, endSession, [], OE_State, OE_Context, false);



%%%% Standard gen_server cast handle
%%
handle_cast(stop, State) ->
    {stop, normal, State};

handle_cast(_, State) ->
    {noreply, State}.


%%%% Standard gen_server handles
%%
handle_info(_, State) ->
    {noreply, State}.


code_change(OldVsn, State, Extra) ->
    corba:handle_code_change(session_Session_I_impl, OldVsn, State, Extra).

