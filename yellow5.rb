# yellow5.rb
require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

# global haml settings
set :haml, { :format => :html4 }

get '/' do
  haml :index
end

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end

# Reload scripts and reset routes on change
# See <http://groups.google.com/group/sinatrarb/browse_thread/thread/a5cfc2b77a013a86>
class Sinatra::Reloader < Rack::Reloader
  def safe_load(file, mtime, stderr = $stderr)
    if file == Sinatra::Application.app_file
      ::Sinatra::Application.reset!
      stderr.puts "#{self.class}: resetting routes"
    end
    super
  end
end
configure(:development) { use Sinatra::Reloader }