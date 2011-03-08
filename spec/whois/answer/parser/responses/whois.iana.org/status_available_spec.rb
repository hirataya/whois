# encoding: utf-8

# This file is autogenerated. Do not edit it manually.
# If you want change the content of this file, edit
#
#   /spec/whois/answer/parser/responses/whois.iana.org/status_available_spec.rb
#
# and regenerate the tests with the following rake task
#
#   $ rake genspec:parsers
#

require 'spec_helper'
require 'whois/answer/parser/whois.iana.org'

describe Whois::Answer::Parser::WhoisIanaOrg, "status_available.expected" do

  before(:each) do
    file = fixture("responses", "whois.iana.org/status_available.txt")
    part = Whois::Answer::Part.new(:body => File.read(file))
    @parser = klass.new(part)
  end

  context "#registrant_contact" do
    it do
      @parser.registrant_contact.should == nil
    end
  end
  context "#admin_contact" do
    it do
      @parser.admin_contact.should == nil
    end
  end
  context "#technical_contact" do
    it do
      @parser.technical_contact.should == nil
    end
  end
end
