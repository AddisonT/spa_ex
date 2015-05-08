class TodosController < ApplicationController
	def index
		@todos = Todo.all
		@todo = Todo.new

		respond_to do |format|
			format.html
			format.json {render json: @todos}
		end
	end

	def create

		@todo = Todo.create(params.require(:todo).permit(:content))

		respond_to do |f| 
			f.html
			f.json { render json: @todo }
		end

	end

	  def destroy
    # find the `todo`
    todo = Todo.find(params[:id])
    # delete the `todo`
    todo.destroy()

    respond_to do |format|
      format.html { redirect_to todos_path }
      format.json { render json: nil, status: 200 }
    end
  end

    def update
    # find the `todo`
    @todo = Todo.find(params[:id])
    # update the todo
    @todo.update_attributes(params.require(:todo).permit(:completed, :content))
    # then respond to format

    respond_to do |format|
      format.html
      format.json { render json: @todo }
    end
  end
end
