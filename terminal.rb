require 'term/ansicolor'

require 'word'
require 'commands'

class Text_UI
  attr_accessor :word

  def initialize(margin = 8)
    @margin = margin
    @c = Term::ANSIColor
  end

  def execute(commands)
    commands.each do |cmd|
      case cmd
        when Show then show(cmd)
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
    word = command.word.bits.join('')
    operator = if command.operator then command.operator else ''end
    operand = if command.operand then
                case command.operand
                when Integer then command.operand.to_s
                when Word then command.operand.bits.join('')
                when String then command.operand
                end
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
  end

  def unknown_command()
    warn('Command not implemented')
  end
end
