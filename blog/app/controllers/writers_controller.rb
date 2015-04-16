class WritersController < ApplicationController
  def index
    @writers = Writer.all
  end
  
  def show
    @writer = Writer.find(params[:id])
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
      current_user_id = @writer[:id]
    else
      #unhappy path
      flash[:alert] = 'There was an error creating the student'
      render :new
    end
  end
  
  def update
    @writer = Writer.find(params[:id])
    
    if @writer.update(writer_params)
      redirect_to @writer
    else
      render 'edit'
    end
  end
  
  def destroy
    @writer = Writer.find(params[:id])
    @writer.destroy
    
    redirect_to writers_path
  end
  
  def login
    @writer =  Writer.new
  end
  
  private
    def writer_params
      params.require(:writer).permit(:name, :password)
 
    end
end