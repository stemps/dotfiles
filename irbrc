require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
%x{gem install 'wirble' --no-ri --no-rdoc} unless Gem.available?('wirble')
%x{gem install 'interactive_editor' --no-ri --no-rdoc} unless Gem.available?('interactive_editor')
Gem.refresh 
require 'wirble'
require 'interactive_editor'

Wirble.init
Wirble.colorize

colors = Wirble::Colorize.colors.merge({
  :object_class => :purple,
  :symbol => :purple,
  :symbol_prefix => :purple
})
Wirble::Colorize.colors = colors

