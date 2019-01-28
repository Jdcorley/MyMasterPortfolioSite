module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Welcome | Jack's Portfolio Website"
    @seo_keywords = "Jack Corley's Portfolio"
  end
end