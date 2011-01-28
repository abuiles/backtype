module Backtype
  ERRORS = ["NotAPIKeyGiven"]

  ERRORS.each do |error|
    class_eval %{
        class #{error} < StandardError; end
      }
  end
end
