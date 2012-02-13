# Testing Class for String Library
# Autor: Kevin Kerney, Ivana Curic

require 'test/unit'
require "pathname"
this_dir = Pathname.new(File.dirname(__FILE__))
require this_dir + "StringLib.rb"


class TestString < Test::Unit::TestCase
  
  def test_one
    #$inputString = InputString.new("AABB")
    assert(StringLib.new("AABB").checkRight("BBAA", 1))
    assert_equal("AABB", InputString.new("AABB").to_s)
  end
end

