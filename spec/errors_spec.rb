require 'spec_helper'

describe Backtype do
  ERRORS = ["NotAPIKeyGiven"]

  ERRORS.each do |error|
    it "should define error #{error}" do
      (Backtype.const_get(error) rescue nil).should_not be_nil
    end
  end
end
