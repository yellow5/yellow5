-module(yellow5_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
  Dispatch = cowboy_router:compile([
    {'_', [
      {"/", cowboy_static, [
        {directory, {priv_dir, yellow5, []}},
        {file, <<"index.html">>},
        {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
      ]},
      {"/[...]", cowboy_static, [
        {directory, {priv_dir, yellow5, []}},
        {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
      ]}
    ]}
  ]),
  EnvPort = os:getenv("PORT"),
  Port = case EnvPort of
    false -> 8080;
    _ -> list_to_integer(EnvPort)
  end,
  {ok, _} = cowboy:start_http(http, 100, [{port, Port}], [
    {env, [{dispatch, Dispatch}]}
  ]),
  yellow5_sup:start_link().

stop(_State) ->
  ok.
