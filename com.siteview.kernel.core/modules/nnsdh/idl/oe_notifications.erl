%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: oe_notifications
%% Source: d:/corba/idl/notifications.idl
%% IC vsn: 4.2.25
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module(oe_notifications).
-ic_compiled("4_2_25").


-include_lib("orber/include/ifr_types.hrl").

%% Interface functions

-export([oe_register/0, oe_unregister/0, oe_get_module/5]).
-export([oe_dependency/0]).



oe_register() ->
    OE_IFR = orber_ifr:find_repository(),

    register_tests(OE_IFR),

    _OE_1 = oe_get_top_module(OE_IFR, "IDL:mtnm.tmforum.org/notifications:1.0", "notifications", "1.0"),

    orber_ifr:'ModuleDef_create_enum'(_OE_1, "IDL:mtnm.tmforum.org/notifications/ObjectType_T:1.0", "ObjectType_T", "1.0", ["OT_EMS","OT_MANAGED_ELEMENT","OT_MULTILAYER_SUBNETWORK",
   "OT_TOPOLOGICAL_LINK","OT_SUBNETWORK_CONNECTION",
   "OT_PHYSICAL_TERMINATION_POINT","OT_CONNECTION_TERMINATION_POINT",
   "OT_TERMINATION_POINT_POOL","OT_EQUIPMENT_HOLDER","OT_EQUIPMENT",
   "OT_PROTECTION_GROUP","OT_TRAFFIC_DESCRIPTOR","OT_AID"]),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/ObjectTypeQualifier_T:1.0", "ObjectTypeQualifier_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})),

    orber_ifr:'ModuleDef_create_enum'(_OE_1, "IDL:mtnm.tmforum.org/notifications/PerceivedSeverity_T:1.0", "PerceivedSeverity_T", "1.0", ["PS_INDETERMINATE","PS_CRITICAL","PS_MAJOR","PS_MINOR","PS_WARNING",
   "PS_CLEARED"]),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/PerceivedSeverityList_T:1.0", "PerceivedSeverityList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
                                               {tk_enum,
                                                "IDL:mtnm.tmforum.org/notifications/PerceivedSeverity_T:1.0",
                                                "PerceivedSeverity_T",
                                                ["PS_INDETERMINATE",
                                                 "PS_CRITICAL","PS_MAJOR",
                                                 "PS_MINOR","PS_WARNING",
                                                 "PS_CLEARED"]},
                                               0})),

    orber_ifr:'ModuleDef_create_enum'(_OE_1, "IDL:mtnm.tmforum.org/notifications/ServiceAffecting_T:1.0", "ServiceAffecting_T", "1.0", ["SA_UNKNOWN","SA_SERVICE_AFFECTING","SA_NON_SERVICE_AFFECTING"]),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/ProbableCauseList_T:1.0", "ProbableCauseList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,{tk_string,0},0})),

    orber_ifr:'ModuleDef_create_struct'(_OE_1, "IDL:mtnm.tmforum.org/notifications/NameAndAnyValue_T:1.0", "NameAndAnyValue_T", "1.0", [#structmember{name="name", type={tk_string,0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})}, #structmember{name="value", type=tk_any, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, tk_any)}]),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/NVList_T:1.0", "NVList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
                                               {tk_struct,
                                                "IDL:mtnm.tmforum.org/notifications/NameAndAnyValue_T:1.0",
                                                "NameAndAnyValue_T",
                                                [{"name",{tk_string,0}},
                                                 {"value",tk_any}]},
                                               0})),

    orber_ifr:'ModuleDef_create_enum'(_OE_1, "IDL:mtnm.tmforum.org/notifications/FileTransferStatus_T:1.0", "FileTransferStatus_T", "1.0", ["FT_IN_PROGRESS","FT_FAILED","FT_COMPLETED"]),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/EventList_T:1.0", "EventList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
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
                                                         [{"domain_name",
                                                           {tk_string,0}},
                                                          {"type_name",
                                                           {tk_string,0}}]}},
                                                       {"event_name",
                                                        {tk_string,0}}]}},
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
                                                    [{"name",{tk_string,0}},
                                                     {"value",tk_any}]},
                                                   0}},
                                                 {"remainder_of_body",
                                                  tk_any}]},
                                               0})),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/SpecificProblem_T:1.0", "SpecificProblem_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/SpecificProblemList_T:1.0", "SpecificProblemList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,{tk_string,0},0})),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/NotifIDList_T:1.0", "NotifIDList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,{tk_string,0},0})),

    orber_ifr:'ModuleDef_create_struct'(_OE_1, "IDL:mtnm.tmforum.org/notifications/CorrelatedNotifications_T:1.0", "CorrelatedNotifications_T", "1.0", [#structmember{name="source", type={tk_sequence,
                                   {tk_struct,
                                    "IDL:mtnm.tmforum.org/globaldefs/NameAndStringValue_T:1.0",
                                    "NameAndStringValue_T",
                                    [{"name",{tk_string,0}},
                                     {"value",{tk_string,0}}]},
                                   0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
                                               {tk_struct,
                                                "IDL:mtnm.tmforum.org/globaldefs/NameAndStringValue_T:1.0",
                                                "NameAndStringValue_T",
                                                [{"name",{tk_string,0}},
                                                 {"value",{tk_string,0}}]},
                                               0})}, #structmember{name="notifIDs", type={tk_sequence,{tk_string,0},0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,{tk_string,0},0})}]),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/CorrelatedNotificationList_T:1.0", "CorrelatedNotificationList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
                                               {tk_struct,
                                                "IDL:mtnm.tmforum.org/notifications/CorrelatedNotifications_T:1.0",
                                                "CorrelatedNotifications_T",
                                                [{"source",
                                                  {tk_sequence,
                                                   {tk_struct,
                                                    "IDL:mtnm.tmforum.org/globaldefs/NameAndStringValue_T:1.0",
                                                    "NameAndStringValue_T",
                                                    [{"name",{tk_string,0}},
                                                     {"value",{tk_string,0}}]},
                                                   0}},
                                                 {"notifIDs",
                                                  {tk_sequence,
                                                   {tk_string,0},
                                                   0}}]},
                                               0})),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/ProposedRepairAction_T:1.0", "ProposedRepairAction_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})),

    orber_ifr:'ModuleDef_create_alias'(_OE_1, "IDL:mtnm.tmforum.org/notifications/ProposedRepairActionList_T:1.0", "ProposedRepairActionList_T", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,{tk_string,0},0})),

    _OE_2 = orber_ifr:'ModuleDef_create_interface'(_OE_1, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0", "EventIterator_I", "1.0", []),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:mtnm.tmforum.org/notifications/EventIterator_I/next_n:1.0", "next_n", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, tk_boolean), 'OP_NORMAL', [#parameterdescription{name="eventList", type={tk_sequence,
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
                                                        [{"domain_name",
                                                          {tk_string,0}},
                                                         {"type_name",
                                                          {tk_string,0}}]}},
                                                      {"event_name",
                                                       {tk_string,0}}]}},
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
                                                   [{"name",{tk_string,0}},
                                                    {"value",tk_any}]},
                                                  0}},
                                                {"remainder_of_body",tk_any}]},
                                              0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
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
                                                         [{"domain_name",
                                                           {tk_string,0}},
                                                          {"type_name",
                                                           {tk_string,0}}]}},
                                                       {"event_name",
                                                        {tk_string,0}}]}},
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
                                                    [{"name",{tk_string,0}},
                                                     {"value",tk_any}]},
                                                   0}},
                                                 {"remainder_of_body",
                                                  tk_any}]},
                                               0}), mode='PARAM_OUT'}
, #parameterdescription{name="how_many", type=tk_ulong, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, tk_ulong), mode='PARAM_IN'}
], [orber_ifr:lookup_id(OE_IFR,"IDL:mtnm.tmforum.org/globaldefs/ProcessingFailureException:1.0")], []),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:mtnm.tmforum.org/notifications/EventIterator_I/getLength:1.0", "getLength", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, tk_ulong), 'OP_NORMAL', [], [orber_ifr:lookup_id(OE_IFR,"IDL:mtnm.tmforum.org/globaldefs/ProcessingFailureException:1.0")], []),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:mtnm.tmforum.org/notifications/EventIterator_I/destroy:1.0", "destroy", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, tk_void), 'OP_NORMAL', [], [orber_ifr:lookup_id(OE_IFR,"IDL:mtnm.tmforum.org/globaldefs/ProcessingFailureException:1.0")], []),

    ok.


%% General IFR registration checks.
register_tests(OE_IFR)->
  re_register_test(OE_IFR),
  include_reg_test(OE_IFR).


%% IFR type Re-registration checks.
re_register_test(OE_IFR)->
  case orber_ifr:'Repository_lookup_id'(OE_IFR,"IDL:mtnm.tmforum.org/notifications/ObjectType_T:1.0") of
    []  ->
      true;
    _ ->
      exit({allready_registered,"IDL:mtnm.tmforum.org/notifications/ObjectType_T:1.0"})
 end.


%% IFR registration checks for included idl files.
include_reg_test(OE_IFR) ->
  case orber_ifr:'Repository_lookup_id'(OE_IFR,"IDL:mtnm.tmforum.org/globaldefs:1.0") of
    [] ->
      exit({unregistered,"IDL:mtnm.tmforum.org/globaldefs:1.0"});
    _  ->
      true
  end,
  case orber_ifr:'Repository_lookup_id'(OE_IFR,"IDL:omg.org/CosNotification:1.0") of
    [] ->
      exit({unregistered,"IDL:omg.org/CosNotification:1.0"});
    _  ->
      true
  end,
  true.


%% Fetch top module reference, register if unregistered.
oe_get_top_module(OE_IFR, ID, Name, Version) ->
  case orber_ifr:'Repository_lookup_id'(OE_IFR, ID) of
    [] ->
      orber_ifr:'Repository_create_module'(OE_IFR, ID, Name, Version);
    Mod  ->
      Mod
   end.

%% Fetch module reference, register if unregistered.
oe_get_module(OE_IFR, OE_Parent, ID, Name, Version) ->
  case orber_ifr:'Repository_lookup_id'(OE_IFR, ID) of
    [] ->
      orber_ifr:'ModuleDef_create_module'(OE_Parent, ID, Name, Version);
    Mod  ->
      Mod
   end.



oe_unregister() ->
    OE_IFR = orber_ifr:find_repository(),

    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/EventIterator_I:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/ProposedRepairActionList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/ProposedRepairAction_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/CorrelatedNotificationList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/CorrelatedNotifications_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/NotifIDList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/SpecificProblemList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/SpecificProblem_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/EventList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/FileTransferStatus_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/NVList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/NameAndAnyValue_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/ProbableCauseList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/ServiceAffecting_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/PerceivedSeverityList_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/PerceivedSeverity_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/ObjectTypeQualifier_T:1.0"),
    oe_destroy(OE_IFR, "IDL:mtnm.tmforum.org/notifications/ObjectType_T:1.0"),
    oe_destroy_if_empty(OE_IFR, "IDL:mtnm.tmforum.org/notifications:1.0"),
    ok.


oe_destroy_if_empty(OE_IFR,IFR_ID) ->
    case orber_ifr:'Repository_lookup_id'(OE_IFR, IFR_ID) of
	[] ->
	    ok;
	Ref ->
	    case orber_ifr:contents(Ref, 'dk_All', 'true') of
		[] ->
		    orber_ifr:destroy(Ref),
		    ok;
		_ ->
		    ok
	    end
    end.

oe_destroy(OE_IFR,IFR_ID) ->
    case orber_ifr:'Repository_lookup_id'(OE_IFR, IFR_ID) of
	[] ->
	    ok;
	Ref ->
	    orber_ifr:destroy(Ref),
	    ok
    end.



%% Idl file dependency list function
oe_dependency() ->

    {"d:/corba/idl/notifications.idl",
     ["globaldefs.idl","CosNotification.idl"]}.

