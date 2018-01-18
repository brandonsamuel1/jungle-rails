class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "Book"

  before_filter :authenticated

  def show
  end

end
