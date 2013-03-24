-module(yellow5).
-export([start/0]).



%%% Public API
start() ->
  ok = application:start(crypto),
  ok = application:start(ranch),
  ok = application:start(cowboy),
  ok = application:start(yellow5).
