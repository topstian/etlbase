# Main maintainers helper
module MaintainerHelper
  include ApplicationHelper

  attr_accessor :input, :output

  def initialize(input)
    @input = input
    @output = nil
  end
end
