class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    # creo una instancia de tarea vacía para poder pasarsela al formulario.
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task.id)
    # lo mando a la vista show (para que vea la task que creó)
  end

  def edit
    @task = Task.find(params[:id])
    # edit busca la tarea que el usuario quiere editar en la BD y la envía
    # a la vista para que muestre el formulario con la tarea (instancia) que el usuario
    # quiere editar pregargada. Cuando el usuario hace submit del form
    # tengo la información de la tarea ctualizada en params
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
    # acá lo estoy redireccionando a la vista de la task que quiere elminar y
    # en esa vista(show) le pregunto si efectivamente desea borrarla.
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
    # el modelo en minúscula.
  end
end
