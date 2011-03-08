require 'test_helper'
require 'whois/answer/parser/whois.cnnic.cn'

class AnswerParserWhoisCnnicCnTest < Whois::Answer::Parser::TestCase

  def setup
    @klass  = Whois::Answer::Parser::WhoisCnnicCn
    @host   = "whois.cnnic.cn"
  end


  def test_disclaimer
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).disclaimer }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).disclaimer }
  end


  def test_domain
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = "google.cn"
    assert_equal_and_cached expected, parser, :domain

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :domain
  end

  def test_domain_id
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = "20030311s10001s00033735-cn"
    assert_equal_and_cached expected, parser, :domain_id

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :domain_id
  end


  def test_referral_whois
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).referral_whois }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).referral_whois }
  end

  def test_referral_url
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).referral_url }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).referral_url }
  end


  def test_status
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = ["clientDeleteProhibited", "serverDeleteProhibited", "clientUpdateProhibited",
                 "serverUpdateProhibited", "clientTransferProhibited", "serverTransferProhibited"]
    assert_equal_and_cached expected, parser, :status

    parser    = @klass.new(load_part('registered_status_ok.txt'))
    expected  = "ok"
    assert_equal_and_cached expected, parser, :status

    parser    = @klass.new(load_part('reserved.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :status

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :status
  end

  def test_available?
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = false
    assert_equal_and_cached expected, parser, :available?

    parser    = @klass.new(load_part('registered_status_ok.txt'))
    expected  = false
    assert_equal_and_cached expected, parser, :available?

    parser    = @klass.new(load_part('reserved.txt'))
    expected  = false
    assert_equal_and_cached expected, parser, :available?

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = true
    assert_equal_and_cached expected, parser, :available?
  end

  def test_registered?
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = true
    assert_equal_and_cached expected, parser, :registered?

    parser    = @klass.new(load_part('registered_status_ok.txt'))
    expected  = true
    assert_equal_and_cached expected, parser, :registered?

    parser    = @klass.new(load_part('reserved.txt'))
    expected  = true
    assert_equal_and_cached expected, parser, :registered?

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = false
    assert_equal_and_cached expected, parser, :registered?
  end


  def test_created_on_with_registered
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = Time.parse("2003-03-17 12:20:00")
    assert_equal_and_cached expected, parser, :created_on
  end

  def test_created_on_with_available
    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :created_on
  end

  def test_updated_on
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).updated_on }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).updated_on }
  end

  def test_expires_on_with_registered
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = Time.parse("2012-03-17 12:48:00")
    assert_equal_and_cached expected, parser, :expires_on
  end

  def test_expires_on_with_available
    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :expires_on
  end


  def test_nameservers
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = %w( ns1.google.cn ns2.google.com ns1.google.com ns3.google.com ns4.google.com ).map { |ns| nameserver(ns) }
    assert_equal_and_cached expected, parser, :nameservers

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = %w()
    assert_equal_and_cached expected, parser, :nameservers
  end


  def test_reserved_question
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = false
    assert_equal  expected, parser.reserved?

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = false
    assert_equal  expected, parser.reserved?

    parser    = @klass.new(load_part('reserved.txt'))
    expected  = true
    assert_equal  expected, parser.reserved?
  end

end
