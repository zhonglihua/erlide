%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: notifications_EventIterator_I
%% Source: d:/corba/idl/notifications.idl
%% IC vsn: 4.2.25
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module(notifications_EventIterator_I).
-ic_compiled("4_2_25").


%% Interface functions
-export([next_n/2, next_n/3, getLength/1]).
-export([getLength/2, destroy/1, destroy/2]).

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



%%%% Operation: next_n
%% 
%%   Returns: RetVal, EventList
%%   Raises:  globaldefs::ProcessingFailureException
%%
next_n(OE_THIS, How_many) ->
    corba:call(OE_THIS, next_n, [How_many], ?MODULE).

next_n(OE_THIS, OE_Options, How_many) ->
    corba:call(OE_THIS, next_n, [How_many], ?MODULE, OE_Options).

%%%% Operation: getLength
%% 
%%   Returns: RetVal
%%   Raises:  globaldefs::ProcessingFailureException
%%
getLength(OE_THIS) ->
    corba:call(OE_THIS, getLength, [], ?MODULE).

getLength(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, getLength, [], ?MODULE, OE_Options).

%%%% Operation: destroy
%% 
%%   Returns: RetVal
%%   Raises:  globaldefs::ProcessingFailureException
%%
destroy(OE_THIS) ->
    corba:call(OE_THIS, destroy, [], ?MODULE).

destroy(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, destroy, [], ?MODULE, OE_Options).

%%------------------------------------------------------------
%%
%% Inherited Interfaces
%%
%%------------------------------------------------------------
oe_is_a("IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0") -> true;
oe_is_a(_) -> false.

%%------------------------------------------------------------
%%
%% Interface TypeCode
%%
%%------------------------------------------------------------
oe_tc(next_n) -> 
	{tk_boolean,
            [tk_ulong],
            [{tk_sequence,
                 {tk_struct,
                     "IDL:omg.org/CosNotification/StructuredEvent:1.0",
                     "StructuredEvent",
                     [{"header",
                       {tk_struct,
                           "IDL:omg.org/CosNotification/EventHeader:1.0",
                           "EventHeader",
                           [{"fixed_header",
                             {tk_struct,
                                 "IDL:omg.org/CosNotification/FixedEventHeader:1.0",
                                 "FixedEventHeader",
                                 [{"event_type",
                                   {tk_struct,
                                       "IDL:omg.org/CosNotification/EventType:1.0",
                                       "EventType",
                                       [{"domain_name",{tk_string,0}},
                                        {"type_name",{tk_string,0}}]}},
                                  {"event_name",{tk_string,0}}]}},
                            {"variable_header",
                             {tk_sequence,
                                 {tk_struct,
                                     "IDL:omg.org/CosNotification/Property:1.0",
                                     "Property",
                                     [{"name",{tk_string,0}},
                                      {"value",tk_any}]},
                                 0}}]}},
                      {"filterable_data",
                       {tk_sequence,
                           {tk_struct,
                               "IDL:omg.org/CosNotification/Property:1.0",
                               "Property",
                               [{"name",{tk_string,0}},{"value",tk_any}]},
                           0}},
                      {"remainder_of_body",tk_any}]},
                 0}]};
oe_tc(getLength) -> 
	{tk_ulong,[],[]};
oe_tc(destroy) -> 
	{tk_void,[],[]};
oe_tc(_) -> undefined.

oe_get_interface() -> 
	[{"destroy", oe_tc(destroy)},
	{"getLength", oe_tc(getLength)},
	{"next_n", oe_tc(next_n)}].




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
    "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0".


%%------------------------------------------------------------
%%
%% Object creation functions.
%%
%%------------------------------------------------------------

oe_create() ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0").

oe_create_link() ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0").

oe_create(Env) ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0", Env).

oe_create_link(Env) ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0", Env).

oe_create(Env, RegName) ->
    corba:create(?MODULE, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0", Env, RegName).

oe_create_link(Env, RegName) ->
    corba:create_link(?MODULE, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0", Env, RegName).

%%------------------------------------------------------------
%%
%% Init & terminate functions.
%%
%%------------------------------------------------------------

init(Env) ->
%% Call to implementation init
    corba:handle_init(notifications_EventIterator_I_impl, Env).

terminate(Reason, State) ->
    corba:handle_terminate(notifications_EventIterator_I_impl, Reason, State).


%%%% Operation: next_n
%% 
%%   Returns: RetVal, EventList
%%   Raises:  globaldefs::ProcessingFailureException
%%
handle_call({_, OE_Context, next_n, [How_many]}, _, OE_State) ->
  corba:handle_call(notifications_EventIterator_I_impl, next_n, [How_many], OE_State, OE_Context, false, false);

%%%% Operation: getLength
%% 
%%   Returns: RetVal
%%   Raises:  globaldefs::ProcessingFailureException
%%
handle_call({_, OE_Context, getLength, []}, _, OE_State) ->
  corba:handle_call(notifications_EventIterator_I_impl, getLength, [], OE_State, OE_Context, false, false);

%%%% Operation: destroy
%% 
%%   Returns: RetVal
%%   Raises:  globaldefs::ProcessingFailureException
%%
handle_call({_, OE_Context, destroy, []}, _, OE_State) ->
  corba:handle_call(notifications_EventIterator_I_impl, destroy, [], OE_State, OE_Context, false, false);



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
    corba:handle_code_change(notifications_EventIterator_I_impl, OldVsn, State, Extra).

