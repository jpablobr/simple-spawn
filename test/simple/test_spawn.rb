# -*- encoding: utf-8 -*-
require 'test_helper'
require 'minitest/autorun'

class Simple::SpawnTest < MiniTest::Unit::TestCase
  def test_pipes
    assert_equal 2, Simple::Spawn::spawn('echo Simple::Spawn test | grep -i spawn').count
    assert_equal 3, Simple::Spawn::spawn('echo Simple::Spawn test | grep -i spawn | sed s/test//').count
  end
end
