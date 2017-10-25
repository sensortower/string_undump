require 'test-unit'

require_relative '../lib/string_undump'

class TestUndump < Test::Unit::TestCase
  def test_undump_badly
    assert_equal('foo', '"foo"'.undump_badly)
    assert_equal('foo#$bar#@baz#{quxx}', 'foo\#$bar\#@baz\#{quxx}'.undump_badly)
    assert_equal(%(\\"\n), '\\\\\\"\n'.undump_badly)
    assert_equal('すごーい', '\u3059\u3054\u30FC\u3044'.undump_badly)
    assert_equal('たのしー', '\xE3\x81\x9F\xE3\x81\xAE\xE3\x81\x97\xE3\x83\xBC'.undump_badly)
    assert_equal('🐾', '\u{1F43E}'.undump_badly)
    assert_equal(%(すごーい\\🐾たのしー\n\#{foo}),
                 ('"\u3059\u3054\u30FC\u3044\\\\\u{1F43E}' +
                  '\xE3\x81\x9F\xE3\x81\xAE\xE3\x81\x97\xE3\x83\xBC\\n\#{foo}"').undump_badly)
  end

  def test_undump_roughly
    assert_equal('foo', '"foo"'.undump_roughly)
    assert_equal('foo#$bar#@baz#{quxx}', 'foo\#$bar\#@baz\#{quxx}'.undump_roughly)
  end

  def test_undump
    assert_includes(String.instance_methods, :undump)
  end
end
