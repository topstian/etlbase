# JSON Serialization wrapper
# Running with Oj
module Jsonizer
  class << self
    # Load from JSON String into Hash
    # @param *args [Oj params] A String is required
    # @return [Hash]
    def load(*args)
      Oj.load(*args)
    end

    # Dump from Hash into JSON String
    # @params *args [Oj params] A Hash is required
    # @return [String]
    def dump(*args)
      Oj.dump(*args)
    end
  end
end
