require 'cuba'

Cuba.define do
  on get, root do
    res.write('yellow5 is alive!')
  end
end
