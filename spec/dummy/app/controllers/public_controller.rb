class PublicController < ApplicationController
  skip_before_action :simple_sign_in_authentication

  def index

  end
end
