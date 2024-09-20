-module(mysuper).
-behavior(supervisor).
-export([init/1]).
-export([start_link/0]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
    SupFlags = #{},
    ChildSpecs = [
        #{id => myserver, start => {gen_server, start_link, [{local, myserver}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver2, start => {gen_server, start_link, [{local, myserver2}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver3, start => {gen_server, start_link, [{local, myserver3}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver4, start => {gen_server, start_link, [{local, myserver4}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver5, start => {gen_server, start_link, [{local, myserver5}, myserver, ["https://1.localhost"], []]}},


        #{id => myserver_2, start => {gen_server, start_link, [{local, myserver_2}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver2_2, start => {gen_server, start_link, [{local, myserver2_2}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver3_2, start => {gen_server, start_link, [{local, myserver3_2}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver4_2, start => {gen_server, start_link, [{local, myserver4_2}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver5_2, start => {gen_server, start_link, [{local, myserver5_2}, myserver, ["https://1.localhost"], []]}},


        #{id => myserver_3, start => {gen_server, start_link, [{local, myserver_3}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver2_3, start => {gen_server, start_link, [{local, myserver2_3}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver3_3, start => {gen_server, start_link, [{local, myserver3_3}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver4_3, start => {gen_server, start_link, [{local, myserver4_3}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver5_3, start => {gen_server, start_link, [{local, myserver5_3}, myserver, ["https://1.localhost"], []]}},


        #{id => myserver_4, start => {gen_server, start_link, [{local, myserver_4}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver2_4, start => {gen_server, start_link, [{local, myserver2_4}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver3_4, start => {gen_server, start_link, [{local, myserver3_4}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver4_4, start => {gen_server, start_link, [{local, myserver4_4}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver5_4, start => {gen_server, start_link, [{local, myserver5_4}, myserver, ["https://1.localhost"], []]}},


        #{id => myserver_5, start => {gen_server, start_link, [{local, myserver_5}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver2_5, start => {gen_server, start_link, [{local, myserver2_5}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver3_5, start => {gen_server, start_link, [{local, myserver3_5}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver4_5, start => {gen_server, start_link, [{local, myserver4_5}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver5_5, start => {gen_server, start_link, [{local, myserver5_5}, myserver, ["https://1.localhost"], []]}},


        #{id => myserver_6, start => {gen_server, start_link, [{local, myserver_6}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver2_6, start => {gen_server, start_link, [{local, myserver2_6}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver3_6, start => {gen_server, start_link, [{local, myserver3_6}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver4_6, start => {gen_server, start_link, [{local, myserver4_6}, myserver, ["https://1.localhost"], []]}},
        #{id => myserver5_6, start => {gen_server, start_link, [{local, myserver5_6}, myserver, ["https://1.localhost"], []]}}
    ],
    {ok, {SupFlags, ChildSpecs}}.