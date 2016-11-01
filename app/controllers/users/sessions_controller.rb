class Users::SessionsController < Devise::SessionsController

  layout 'login', only: [:new]

end