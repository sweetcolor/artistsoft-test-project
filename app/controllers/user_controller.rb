class UserController < ApplicationController
  before_action :get_params, :get_users, only: :load_users

  def index
  end

  def load_users
    render json: {
        draw: @draw,
        recordsTotal: @users.count,
        recordsFiltered: @users.count,
        users: @users
    }
  end

  private

  def get_users
    @users = User.any_of({ first_name: @search },
                         { address: @search },
                         { last_name: @search })
                 .offset(@page_start)
                 .limit(@page_len)
                 .order({ @columns[@order['0']['column']]['data'] => @order['0']['dir'] })
  end

  def get_params
    @draw = params[:draw]
    @page_start = params[:start]
    @page_len = params[:length]
    @search = Regexp.new("\\w*#{params[:search]['value']}\\w*", Regexp::IGNORECASE)
    @order = params[:order]
    @columns = params[:columns]
  end
end
