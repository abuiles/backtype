module Backtype
  ERRORS = {
    :api_key       => {:klass_name => "NotAPIKeyGiven",
                       :message => "You must pass an api_key as parameter"},
    :missing_params => {:klass_name => "MissingParameters"}
  }

  ERRORS.each_value do |error|
    message = error.has_key?(:message) ? "def to_s;\"#{error[:message]}\"end" : ""
    class_eval %{
      class #{error[:klass_name]} < StandardError
        #{message}
      end
      }
  end
end
