class RedirectsController < ApplicationController

  def new
    @new_redirect = Redirect.new
    @short_url = params[:short_url]
  end

  def show
    @token = params[:id]
    @full_url = Redirect.find_by_token(@token).full_url
    redirect_to @full_url
  end

  def create
    @redirect = Redirect.create(url_params)
    @short_url = "#{request.base_url}/#{@redirect.token}"
    redirect_to new_redirect_path(short_url: @short_url)
  end

  def info

  end

  private

  def url_params
    params.permit(:full_url)
  end

end
