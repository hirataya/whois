# encoding: utf-8

# This file is autogenerated. Do not edit it manually.
# If you want change the content of this file, edit
#
#   /spec/whois/answer/parser/responses/whois.nic.hu/schema-1.99/property_contact_company_spec.rb
#
# and regenerate the tests with the following rake task
#
#   $ rake genspec:parsers
#

require 'spec_helper'
require 'whois/answer/parser/whois.nic.hu'

describe Whois::Answer::Parser::WhoisNicHu, "property_contact_company.expected" do

  before(:each) do
    file = fixture("responses", "whois.nic.hu/schema-1.99/property_contact_company.txt")
    part = Whois::Answer::Part.new(:body => File.read(file))
    @parser = klass.new(part)
  end

  context "#registrant_contact" do
    it do
      @parser.registrant_contact.should be_a(_contact)
    end
    it do
      @parser.registrant_contact.type.should         == Whois::Answer::Contact::TYPE_REGISTRANT
    end
    it do
      @parser.registrant_contact.id.should           == nil
    end
    it do
      @parser.registrant_contact.name.should         == "Google, Inc."
    end
    it do
      @parser.registrant_contact.organization.should == "Google, Inc."
    end
    it do
      @parser.registrant_contact.address.should      == "Amphitheatre Pkwy 1600."
    end
    it do
      @parser.registrant_contact.city.should         == "Mountain View"
    end
    it do
      @parser.registrant_contact.zip.should          == "CA-94043"
    end
    it do
      @parser.registrant_contact.state.should        == nil
    end
    it do
      @parser.registrant_contact.country_code.should == "US"
    end
    it do
      @parser.registrant_contact.phone.should        == "+1 650 253 0000"
    end
    it do
      @parser.registrant_contact.fax.should          == "+1 650 253 0001"
    end
    it do
      @parser.registrant_contact.email.should        == nil
    end
  end
end
