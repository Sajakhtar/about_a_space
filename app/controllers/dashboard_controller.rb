class DashboardController < ApplicationController
  skip_after_action :verify_authorized, only: [:my_account]

  def my_account
    # current_user.bookings
    # current_user.spaces
  end
end
