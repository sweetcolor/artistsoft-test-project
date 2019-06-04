class UserController < ApplicationController
  before_action :get_params, only: :load_users

  def index
  end

  def load_users
    @users = User.offset(@page_start)
                 .limit(@page_len)
                 .order({ @columns[@order['0']['column']]['data'] =>  @order['0']['dir'] })

    render json: {
        draw: @draw,
        recordsTotal: @users.count,
        recordsFiltered: @users.count,
        users: @users
    }
  end

  private

  def get_params
    @draw = params[:draw]
    @page_start = params[:start]
    @page_len = params[:length]
    @search = params[:search]
    @order = params[:order]
    @columns = params[:columns]
  end
end
