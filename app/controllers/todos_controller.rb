class TodosController < ApplicationController

  

  def index
    @todo_list_names = Todo.all.map(&:list_name).uniq
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    @todo = Todo.new params[:todo]
    if @todo.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find params[:id]
  end

  def update
    @todo = Todo.find params[:id]
    if @todo.update_attributes params[:todo]
      redirect_to @todo
    else
      render :edit
    end
  end

end
