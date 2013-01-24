require "stylesheets_for_all/version"
require "action_view"

module StylesheetsForAll
  module ActionViewExtensions

    def stylesheet_link_tag(*sources)
      options = sources.last.is_a?(Hash) ? sources.pop.stringify_keys : { }
      sources << {'media' => 'all'}.merge(options)
      super
    end

  end
end

ActionView::Base.send :include, StylesheetsForAll::ActionViewExtensions
