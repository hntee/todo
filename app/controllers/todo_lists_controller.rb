class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = current_user.todo_lists.all
  end

  def new
    @todo_list = current_user.todo_lists.new
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)
    if @todo_list.save
      redirect_to todo_lists_path
    else
      render :new
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to todo_lists_path
    else
      render :edit
    end
  end

  def destroy
    # render plain: params
    @todo_list.destroy
    redirect_to todo_lists_path
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:content, :completed)
    end

    def set_todo_list
      @todo_list = current_user.todo_lists.find(params[:id])
    end
end
