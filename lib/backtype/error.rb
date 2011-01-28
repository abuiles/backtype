module Backtype
  ERRORS = {
    :api_key   => {:klass_name => "NotAPIKeyGiven",
                   :message => "You must pass an api_key as parameter" },
    :no_params => {:klass_name => "NotParametersGiven",
                   :message => "You must pass the required parameters" },

  }

  ERRORS.each_value do |error|
    class_eval %{
      class #{error[:klass_name]} < StandardError
        def to_s
          "#{error[:message]}"
        end
      end
      }
  end
end
