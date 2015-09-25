module V2
  class ApplicationController < ::ApplicationController
    before_filter :set_template

    private

    def set_template
      @template = "template_v2"
    end
  end
end
