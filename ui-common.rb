class UI_With_Masks
  def apply_mask_command(mask, command)
    mask.each_index do |i|
      if i >= command.start && i <= command.stop then
        mask[i] = true
      end
    end
    output_word(@word)
  end
end
