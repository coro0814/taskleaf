class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    # @tasks = Task.all
    # @tasks = current_user.tasks.recent
    @tasks = @q.result(distinct: true).recent.page(params[:page])
  end

  def show
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def create
    #@task = Task.new(task_params.merge(user_id: current_user.id))
    @task = current_user.tasks.build(task_params)

    if params[:back].present?
      render :new
      return
    end

    if @task.save
      logger.debug "task: #{@task.attributes.inspect}"
      # メール送る処理はこれ
      # TaskMailer.creation_email(@task).deliver_now
      # 5分後に送信するならこんな感じ
      # TaskMailer.creation_email(@task).deliver_later(wait: 5.minutes)
      SampleJob.perform_later

      redirect_to @task, notice: "タスク「#{@task.name}」をとうろくしました"
    else
      render :new
    end
  end

  def edit
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # task = Task.find(params[:id])
    # task = current_user.tasks.find(params[:id])
    @task.update!(task_params)
    redirect_to tasks_path, notice: "やること「#{@task.name}」をこうしんしました"
  end

  def destroy
    # task = Task.find(params[:id])
    # task = current_user.tasks.find(params[:id])
    @task.destroy
    # リダイレクトせずに、クライアント側で表示を変えるだけにする
    # redirect_to tasks_path, notice: "タスク「#{@task.name}」をさくじょしました。"
    # head :no_content
  end

  private

  def task_params
    # permitはparamsの中(task)のなかから絞ってる。
    # 今回で言えば、nameとdescriptionにしぼって余計な値は取り除いている。
    params.require(:task).permit(:name, :description, :image)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
