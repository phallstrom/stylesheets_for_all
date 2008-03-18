#
# Default to media=all unless already set. This way printed pages have a chance
# of looking the same as they do online.
#
module ActionView
  module Helpers
    module AssetTagHelper

      alias_method :stylesheet_link_tag_orig, :stylesheet_link_tag

      def stylesheet_link_tag(*sources)
        options = sources.last.is_a?(Hash) ? sources.pop.stringify_keys : { }
        sources << {'media' => 'all'}.merge(options)
        stylesheet_link_tag_orig *sources
      end

    end
  end
end
