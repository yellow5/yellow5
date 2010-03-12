require 'rubygems'
require 'sinatra'

set :environment, :production
set :run, false

require 'yellow5'
run Sinatra::Application
