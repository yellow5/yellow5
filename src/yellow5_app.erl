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
      {"/[...]", cowboy_static, [
        {directory, {priv_dir, yellow5, []}},
        {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
      ]}
    ]}
  ]),
  {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
    {env, [{dispatch, Dispatch}]}
  ]),
  yellow5_sup:start_link().

stop(_State) ->
  ok.
