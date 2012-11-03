require 'term/ansicolor'

require 'word'
require 'commands'

class Text_UI
  attr_accessor :word

  def initialize(margin = 8)
    @margin = margin
    @padding = ''
    @c = Term::ANSIColor
  end

  def execute(commands)
    commands.each do |cmd|
      case cmd
        when Show then show(cmd)
        when Move then move(cmd)
        else unknown_command()
      end
    end
  end

  def margin(size = nil)
    Array.new(if size then size else @margin end, ' ').join('')
  end

  def message(title, color, content)
    print color, "{#{title}: #{content}}", @c.reset, "\n"
  end

  def warn(warning)
    message('WARNING', @c.yellow, warning)
  end

  def err(error)
    message('ERROR', @c.red, error)
  end

  def show(command)
    word = command.word.to_s
    operator = if command.operator then command.operator else ''end
    operand = if command.operand then
                command.operand.to_s
              else ''
              end

    length1 = word.length
    length2 = operator.length + 2 + operand.length
    padding1 = if length2 > length1 then
                 Array.new(length2 - length1, ' ').join('')
                 else ''
                 end

    print margin(), padding1, word, "\n", margin(), operator, '  ', operand, "\n"
    @word = command.word
    @padding = padding1
  end

  def move(command)
    if command.direction then
      # Left
      if command.width > @margin then
        err('Cannot move that much!')
      else
        print margin(@margin - command.width), @padding, @word.to_s, "\n"
      end
    else
      # Right
    end
  end

  def unknown_command()
    warn('Command not implemented')
  end
end
