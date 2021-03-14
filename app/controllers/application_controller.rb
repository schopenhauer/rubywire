class ApplicationController < ActionController::Base
  include WgHelper

  def home
    render 'layouts/home', locals: {
      wg_installed: wg?,
      wg_version: wg? ? wg_version : 'wireguard-tools not installed'
    }
  end

end
