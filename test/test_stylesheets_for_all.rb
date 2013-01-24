require 'rubygems'
require 'test/unit'

require 'action_controller'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'

require 'stylesheets_for_all'

class TestStylesheetsForAll < ActionView::TestCase
  tests ActionView::Helpers::AssetTagHelper
  tests StylesheetsForAll::ActionViewExtensions

  StyleLinkToTag = {
    %(stylesheet_link_tag("style")) => %(<link href="/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("style", :type => "foo/bar")) => %(<link href="/stylesheets/style.css" media="all" rel="stylesheet" type="foo/bar" />),
    %(stylesheet_link_tag("style", :media => "screen")) => %(<link href="/stylesheets/style.css" media="screen" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("style", :media => "screen", :type => "foo/bar")) => %(<link href="/stylesheets/style.css" media="screen" rel="stylesheet" type="foo/bar" />),
  }

  def test_stylesheet_link_tag
    ENV["RAILS_ASSET_ID"] = ""
    StyleLinkToTag.each { |method, tag| assert_dom_equal(tag, eval(method)) }
  end

end
