require 'rubygems'

['actionpack/lib', 'actionpack/lib/action_view'].each do |p|
  path = File.dirname(__FILE__) + "/../../../rails/#{p}"
  next unless File.directory?(path)
  $:.unshift(path)
end

require 'action_controller'
require 'action_controller/assertions'
require 'action_view'

require File.dirname(__FILE__) + "/../lib/stylesheets_for_all.rb"

require 'test/unit'

class StylesheetsForAllTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper

  def setup
    @controller = Class.new do

      attr_accessor :request
    
      def url_for(options, *parameters_for_method_reference)
        "http://www.example.com"
      end
      
    end.new
    
    @request = Class.new do 
      def relative_url_root
        ""
      end       

      def protocol
        'http://'
      end
    end.new

    @controller.request = @request
    
    ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
  end

  def teardown
    Object.send(:remove_const, :RAILS_ROOT) if defined?(RAILS_ROOT)
    ENV["RAILS_ASSET_ID"] = nil
  end

  StyleLinkToTag = {
    %(stylesheet_link_tag("style")) => %(<link href="/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("style.css")) => %(<link href="/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("/dir/file")) => %(<link href="/dir/file.css" media="all" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("dir/file")) => %(<link href="/stylesheets/dir/file.css" media="all" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("style", :media => "screen")) => %(<link href="/stylesheets/style.css" media="screen" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("random.styles", "/css/stylish")) => %(<link href="/stylesheets/random.styles" media="all" rel="stylesheet" type="text/css" />\n<link href="/css/stylish.css" media="all" rel="stylesheet" type="text/css" />),
    %(stylesheet_link_tag("http://www.example.com/styles/style")) => %(<link href="http://www.example.com/styles/style.css" media="all" rel="stylesheet" type="text/css" />)
  }

  def test_stylesheet_link_tag
    ENV["RAILS_ASSET_ID"] = ""
    StyleLinkToTag.each { |method, tag| assert_dom_equal(tag, eval(method)) }
  end

end
