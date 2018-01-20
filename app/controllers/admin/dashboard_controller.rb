class Admin::DashboardController < ApplicationController
  before_filter :authenticated
  http_basic_authenticate_with name: "Jungle", password: "Book"

  def show
  end

end
