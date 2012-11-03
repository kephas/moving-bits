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
        else unknown_command()
      end
    end
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

    print padding1, word, "\n", operator, '  ', operand, "\n"
    @word = command.word
  end

  def unknown_command()
    puts '{Command not implemented}'
  end
end
