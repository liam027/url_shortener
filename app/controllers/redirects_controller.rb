class RedirectsController < ApplicationController

  def new
    @new_redirect = Redirect.new
    @short_url = params[:short_url]
  end

  def show
    @token = params[:id]
    @redirect = Redirect.find_by_token(@token)

    # Register the visit. Create a new visit or update the count if it already
    # exists
    if(@redirect.visits.exists?(ip_address: request.remote_ip ))
      @visit = @redirect.visits.find_by_ip_address(request.remote_ip)
      @visit.update(count: @visit.count + 1)
    else
      @redirect.visits.create(ip_address: request.remote_ip)
    end

    redirect_to @redirect.full_url
  end

  def create
    @redirect = Redirect.create(url_params)
    @short_url = "#{request.base_url}/#{@redirect.token}"

    redirect_to new_redirect_path(short_url: @short_url)
  end

  def info
    @redirect = Redirect.find_by_token(params[:id])
    @short_url = "#{request.base_url}/#{@redirect.token}"
  end

  private

  def url_params
    params.permit(:full_url)
  end

end
