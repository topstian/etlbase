# Main ETL helper (extractor, transformer and loader)
module EtlHelper
  include ApplicationHelper

  attr_accessor :input, :output

  def initialize(input)
    @input = input
    @output = nil
  end
end
