-module(myapp_server).
-behavior(gen_server).
-include("data.hrl").
-export([    
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    code_change/3,
    terminate/2
]).

-record(state, {host, counter, client}).

init([I, Host, Counter, Client]) ->
    process_flag(trap_exit, true),
    self() ! request,
    io:format("server ~p started~n", [I]),
    {ok, #state{host = Host, counter = Counter, client = Client}}.

handle_call(_Name, _From, State) ->
    {reply, ok, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(request, State = #state{counter = Counter})->
    case request(State) of
        ok -> counters:add(Counter, 1, 1);
        _  -> counters:add(Counter, 2, 1)
    end,
    self() ! request,
    {noreply, State};

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    [].
code_change(_OldVsn, _State, _Extra) ->
    {error, ok}.



request(#state{host = Host, client = httpc}) ->
    Id = base64:encode(crypto:strong_rand_bytes(50)),
    Result = httpc:request(post, {Host, [{"X-Request-Id", Id}], "application/x-www-form-urlencoded", ?body}, [{ssl, [{verify, verify_none}]}], []),
    case Result of

        {ok, {{_, _Status, _}, _, _Response}} ->
            % io:format("request ok ~p~n", [_Status]),
            ok;
        Error   ->
            io:format("request error: ~p ~p~n", [Id, Error]),
            {error, Error}
    end;


request(#state{host = Host, client = hackney}) ->
    Id = base64:encode(crypto:strong_rand_bytes(50)),
    Result = hackney:request(post, Host, [{"X-Request-Id", Id}], ?body, [{ssl_options, [{verify, verify_none}]}, {connect_timeout, 5000}]),
    case Result of

        {ok, _StatusCode, _RespHeaders, ClientRef} ->
           
            case hackney:body(ClientRef) of
                {ok, _} -> 
                        % io:format("request ok ~p~n", [_Status]),
                        ok;
                 Error   ->
                    io:format("hackney body error: ~p ~p~n", [Id, Error]),
                    {error, Error}
            end;
        Error   ->
            io:format("request error: ~p ~p~n", [Id, Error]),
            {error, Error}
    end.