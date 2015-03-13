require 'cuba'
require 'cuba/render'
require 'tilt/haml'

# Configure Cuba to serve static files
Cuba.use Rack::Static, root: 'public', urls: [ '/images', '/styles' ]

# Configure Cuba to render haml templates
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = 'haml'

Cuba.define do
  # Render the index page wrapped in the layout.
  on get, root do
    render('index')
  end
end
