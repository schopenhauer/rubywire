require 'uri'

module ApplicationHelper

  def relative_path(url)
    URI(url).path unless url.nil?
  end

end
