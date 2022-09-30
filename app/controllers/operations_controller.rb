class OperationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @operations = Operation.all
  end

  def new
    @operation = Operation.new
  end

  def create
    @category = Category.find(params[:operation][:category_id])
    @operation = Operation.new(opertaion_params)
    @operation.user_id = current_user.id
    respond_to do |format|
      if @operation.save
        @category.operations << @operation
        format.html { redirect_to @category, notice: 'operation was successfully created.' }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy
    redirect_to operations_path, notice: 'operation was successfully Deleted.'
  end

  private

  def opertaion_params
    params.require(:operation).permit(:name, :amount)
  end
end
