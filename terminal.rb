require 'term/ansicolor'

require 'word'
require 'commands'
require 'ui-common'

class Text_UI < UI_With_Masks
  def initialize(width = 16)
    @width = width
    @alpha_mask = nil
    @emphasis_mask = nil
    @offset = 0
    @c = Term::ANSIColor
  end

  def execute(commands)
    commands.each do |cmd|
      case cmd
        when Show then show(cmd)
        when Move then move(cmd)
        when Erase then erase(cmd)
        when Emphasis then emphasis(cmd)
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
    print spaces(@width - word.length + @offset)
    word.bits.each_index do |i|
      if !@alpha_mask[i] then
        if @emphasis_mask[i] then print @c.bold end
        print word.bits[i]
        print @c.reset
      else
        print ' '
      end
    end
    print "\n"
  end

  def show(command)
    @offset = 0
    @alpha_mask = Array.new(command.word.length, false)
    @emphasis_mask = Array.new(command.word.length, false)
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

  def erase(command) apply_mask_command(@alpha_mask, command) end
  def emphasis(command) apply_mask_command(@emphasis_mask, command) end

  def unknown_command()
    warn('Command not implemented')
  end
end
