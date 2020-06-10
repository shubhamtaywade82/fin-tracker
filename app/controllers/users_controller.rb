# frozen_string_literal: true

class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/f_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'No user found'
          format.js { render partial: 'users/f_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a friend name or email to search'
        format.js { render partial: 'users/f_result' }
      end
    end
  end
end
