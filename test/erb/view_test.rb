require 'test_helper'

class Erb::ViewTest < Minitest::Test
  class SimpleView
    include Erb::View
    template :simple
  end

  class DataView
    include Erb::View
    template :with_data
    exposes  :name
  end

  class MethodView
    include Erb::View
    template :with_data
    exposes  :name

    def name
      'doug'
    end
  end

  def setup
    Erb.root = 'test/assets'
  end

  def test_render
    view = SimpleView.new
    assert_match 'simple template', view.render
  end

  def test_render_from_parameters
    view = DataView.new
    assert_match 'youki dog', view.render(name: 'youki')
    assert_match 'bolik dog', view.render(name: 'bolik')
  end

  def test_render_from_methods
    view = MethodView.new
    assert_match 'doug dog', view.render
  end
end
