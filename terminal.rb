require 'term/ansicolor'

require 'word'
require 'commands'

class Text_UI
  def initialize(width = 16)
    @width = width
    @alpha_mask = nil
    @offset = 0
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

  def message(title, color, content)
    print color, "{#{title}: #{content}}", @c.reset, "\n"
  end

  def warn(warning)
    message('WARNING', @c.yellow, warning)
  end

  def err(error)
    message('ERROR', @c.red, error)
  end

  def spaces(size) Array.new(size, ' ').join('') end

  def output_word(word)
    @word = word
    print spaces(@width - word.length + @offset), word, "\n"
  end

  def show(command)
    @offset = 0
    @alpha_mask = nil
    output_word(command.word)

    operator = if command.operator then command.operator else '' end
    operand = if command.operand then
                command.operand.to_s
              else ''
              end

    print spaces(@width - operator.length - 2 - operand.length), operator, '  ', operand, "\n"
  end

  def move(command)
    if command.direction then
      # Left
      if command.width > (@width - @word.length) then
        err('Cannot move that much!')
      else
        @offset = 0 - command.width
      end
    else
      # Right
      @offset = command.width
    end
    output_word(@word)
  end

  def unknown_command()
    warn('Command not implemented')
  end
end
