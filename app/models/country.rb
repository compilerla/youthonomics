class Country < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper

  def as_json(opts = {})
    super(opts).merge({
      path: Rails.application.routes.url_helpers.country_path(self)
    })
  end
end