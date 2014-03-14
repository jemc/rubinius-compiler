require 'rubinius/bridge'
require 'rubinius/toolset'

Rubinius::ToolSets.create :spec do
  require "rubinius/melbourne"
  require "rubinius/processor"
  require "rubinius/compiler"
  require "rubinius/ast"

  require 'spec/custom/matchers/compile_as'
  require 'spec/custom/runner/relates'
end
