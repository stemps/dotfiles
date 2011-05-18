require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
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

