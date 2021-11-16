# frozen_string_literal: true

# Global helper to make the app tell you things
# Works with Rails logger spec (debug, info, warning, error, fatal)
module Say
  class << self
    LOG_LEVEL = ENV.fetch('LOG_LEVEL', 0).to_i
    TYPES = { debug: { level: 0, color: '35m' },
              info: { level: 1, color: '32m' },
              warning: { level: 2, color: '33m' },
              error: { level: 3, color: '34m' },
              fatal: { level: 4, color: '36m' } }.freeze

    # Says a message
    # @example
    #   Say.error(context: 'ExampleExtractor', message: 'Process failed')
    # @param arguments [Array<Hash>]
    # @option arguments [Hash]
    #   * :context (String)
    #   * :message (String)
    #   * :backtrace (String)
    # @return [nil]
    def method_missing(method, *arguments)
      message = arguments[0][:message]
      message << ". Backtrace: #{arguments[0][:backtrace]}" if arguments[0][:backtrace].present?
      display(type: method.to_s, context: arguments[0][:context], message: message)

      # At this point you should notify this warning, Slack maybe?
    end

    # Should I answer to method missing?
    # @param method [Object]
    # @return [Boolean] The method is included in TYPES?
    def respond_to_missing?(method)
      TYPES.map { |k, _v| k.to_s }.include?(method.to_s)
    end

    private

    # Display a message with puts
    # @example
    #   display(type: 'debug', context: 'Example', message: 'Test!')
    # @param input [Hash]
    # @option input [Hash]
    #   * :type (String)
    #   * :context (String)
    #   * :message (String)
    # @return [nil]
    def display(input)
      type = TYPES[input[:type].to_sym] || return
      return unless type[:level] >= LOG_LEVEL

      puts "\e[#{type[:color]}[#{ENV['APP_NAME']}][#{input[:type].upcase}]\e[0m #{input[:context]}: #{input[:message]}"
    end
  end
end
