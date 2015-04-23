class SessionsController < ApplicationController

  before_action :authorize, only: [:destroy]

  def new
    
  end

  def create
    writer = Writer.find_by(name: params[:name])
    if writer && writer.authenticate(params[:password])

      session[:writer_id] = writer.id
      redirect_to writer_path(writer), notice: "Welcome back #{writer.name}!"
    else
      flash[:alert] = "Invalid name or password."
      render :new
    end
  end

  def destroy
    session[:writer_id] = nil
    redirect_to :root, notice: "Logged out."
  end
  
end