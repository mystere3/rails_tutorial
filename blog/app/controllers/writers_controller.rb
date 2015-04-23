class WritersController < ApplicationController

  # before_action :authorize, except: [:index, :show, :new]

  def index
    @writers = Writer.all
  end
  
  def show
    # binding.pry
    @writer = Writer.find_by_id(params[:id])
    @articles = @writer.articles
  end
  
  def new
    @writer = Writer.new
  end
  
  def edit
    @writer = Writer.find(params[:id])
  end
  
  def create
#     binding.pry
    @writer = Writer.new(writer_params)
    
    if @writer.save
      #happy path
      # THIS SECOND BIT OF NEXT LINE IS THE SAME AS FLASH MESSAGE BELOW IN DESTROY
      redirect_to writer_path(@writer), notice: 'User was added successfully' 
    else
      #unhappy path
      flash[:alert] = 'There was an error creating the user'
      render :new
    end
  end
  
  def update
    @writer = Writer.find_by_id(writer_params)
    
    if @writer.update_attributes(params[:writer])
      redirect_to writer_path(@writer), notice: 'User updated successfully.'
    else
      flash[:alert] = 'There was an error updating user.'
      render :edit
    end
  end
  
  def destroy
    @writer = Writer.find_by_id(params[:id])
    if @writer
      @writer.destroy
      flash[:notice] = "#{@writer.name} was successfully deleted."
    end
    
    
    redirect_to writers_path
  end
  
  # def login
  #   @writer =  Writer.new
  # end

  # def validate

  # end
  
  private
    def writer_params
      params.require(:writer).permit(:name, :password)
 
    end
end