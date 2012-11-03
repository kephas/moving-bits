require 'term/ansicolor'

require 'word'
require 'commands'

c = Term::ANSIColor

class Text_UI
  attr_accessor :word

  def execute(commands)
    commands.each do |cmd|
      case cmd
        when Show then show(cmd)
      end
    end
  end
end
