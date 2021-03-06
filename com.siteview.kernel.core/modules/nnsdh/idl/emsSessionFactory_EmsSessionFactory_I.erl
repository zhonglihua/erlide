%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: emsSessionFactory_EmsSessionFactory_I
%% Source: d:/corba/idl/emsSessionFactory.idl
%% IC vsn: 4.2.25
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module(emsSessionFactory_EmsSessionFactory_I).
-ic_compiled("4_2_25").


%% Interface functions
-export([getEmsSession/4, getEmsSession/5]).

%% Exports from "mtnmVersion::Version_I"
-export([getVersion/1, getVersion/2]).

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



%%%% Operation: getEmsSession
%% 
%%   Returns: RetVal, EmsSessionInterface
%%   Raises:  globaldefs::ProcessingFailureException
%%
getEmsSession(OE_THIS, User, Password, Client) ->
    corba:call(OE_THIS, getEmsSession, [User, Password, Client], ?MODULE).

getEmsSession(OE_THIS, OE_Options, User, Password, Client) ->
    corba:call(OE_THIS, getEmsSession, [User, Password, Client], ?MODULE, OE_Options).

%%%% Operation: getVersion
%% 
%%   Returns: RetVal
%%
getVersion(OE_THIS) ->
    corba:call(OE_THIS, getVersion, [], ?MODULE).

getVersion(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, getVersion, [], ?MODULE, OE_Options).

%%------------------------------------------------------------
%%
%% Inherited Interfaces
%%
%%------------------------------------------------------------
oe_is_a("IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0") -> true;
oe_is_a("IDL:mtnm.tmforum.org/mtnmVersion/Version_I:1.0") -> true;
oe_is_a(_) -> false.

%%------------------------------------------------------------
%%
%% Interface TypeCode
%%
%%------------------------------------------------------------
oe_tc(getEmsSession) -> 
	{tk_void,[{tk_string,0},
                  {tk_string,0},
                  {tk_objref,"IDL:mtnm.tmforum.org/nmsSession/NmsSession_I:1.0",
                             "NmsSession_I"}],
                 [{tk_objref,"IDL:mtnm.tmforum.org/emsSession/EmsSession_I:1.0",
                             "EmsSession_I"}]};
oe_tc(getVersion) -> mtnmVersion_Version_I:oe_tc(getVersion);
oe_tc(_) -> undefined.

oe_get_interface() -> 
	[{"getVersion", mtnmVersion_Version_I:oe_tc(getVersion)},
	{"getEmsSession", oe_tc(getEmsSession)}].




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
    "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0".


%%------------------------------------------------------------
%%
%% Object creation functions.
%%
%%------------------------------------------------------------

oe_create() ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0").

oe_create_link() ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0").

oe_create(Env) ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0", Env).

oe_create_link(Env) ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0", Env).

oe_create(Env, RegName) ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0", Env, RegName).

oe_create_link(Env, RegName) ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/emsSessionFactory/EmsSessionFactory_I:1.0", Env, RegName).

%%------------------------------------------------------------
%%
%% Init & terminate functions.
%%
%%------------------------------------------------------------

init(Env) ->
%% Call to implementation init
    corba:handle_init(emsSessionFactory_EmsSessionFactory_I_impl, Env).

terminate(Reason, State) ->
    corba:handle_terminate(emsSessionFactory_EmsSessionFactory_I_impl, Reason, State).


%%%% Operation: getEmsSession
%% 
%%   Returns: RetVal, EmsSessionInterface
%%   Raises:  globaldefs::ProcessingFailureException
%%
handle_call({_, OE_Context, getEmsSession, [User, Password, Client]}, _, OE_State) ->
  corba:handle_call(emsSessionFactory_EmsSessionFactory_I_impl, getEmsSession, [User, Password, Client], OE_State, OE_Context, false, false);

%%%% Operation: getVersion
%% 
%%   Returns: RetVal
%%
handle_call({_, OE_Context, getVersion, []}, _, OE_State) ->
  corba:handle_call(emsSessionFactory_EmsSessionFactory_I_impl, getVersion, [], OE_State, OE_Context, false, false);



%%%% Standard gen_server call handle
%%
handle_call(stop, _, State) ->
    {stop, normal, ok, State};

handle_call(_, _, State) ->
    {reply, catch corba:raise(#'BAD_OPERATION'{minor=1163001857, completion_status='COMPLETED_NO'}), State}.


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
    corba:handle_code_change(emsSessionFactory_EmsSessionFactory_I_impl, OldVsn, State, Extra).

