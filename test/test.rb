require 'minitest/autorun'
load 'lib/thing_or_things.rb'



def itself things
  things.inject({}) {|res, x| res[x] = x; res }
end


class ThingTest < Minitest::Test


  def test_basics
    assert_equal(
      1,
      thing_or_things(1) {|things| itself(things) }
    )
    assert_equal(
      { 1 => 1 },
      thing_or_things([ 1 ]) {|things| itself(things) }
    )
    assert_equal(
      { 1 => 1, 2 => 2 },
      thing_or_things([ 1, 2 ]) {|things| itself(things) }
    )
    assert_equal(
      { 1 => 1, 2 => 2 },
      thing_or_things(1, 2) {|things| itself(things) }
    )
  end


  def test_fn_context
    def load_stuff(id_or_ids)
      thing_or_things(id_or_ids) do |ids|
        itself(ids)
      end
    end

    assert_equal(
      1,
      load_stuff(1)
    )
    assert_equal(
      { 1 => 1 },
      load_stuff([ 1 ])
    )
    assert_equal(
      { 1 => 1, 2 => 2 },
      load_stuff([ 1, 2 ])
    )
  end


  def test_return_type
    assert_raises TypeError do
      thing_or_things(1) { true }
    end

    assert_raises TypeError do
      thing_or_things(1, 2, 3) {|things| things }
    end
  end


  def test_missing_key
    assert_raises KeyError do
      thing_or_things(1) { {} }
    end

    assert_raises KeyError do
      thing_or_things(1, 2) { { 1 => 1 } }
    end
  end


  def test_extra_key
    assert_raises KeyError do
      thing_or_things(1) { { 1 => 1, 2 => 2 } }
    end
  end


end
