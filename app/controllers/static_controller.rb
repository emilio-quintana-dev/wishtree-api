class StaticController < ApplicationController
  def home
    render json: { message: "Hello, world!" }
  end
end
