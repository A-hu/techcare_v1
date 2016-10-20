class Users::SessionsController < Devise::SessionsController
  layout 'login', only: [:new]

  def new
    super
  end
end