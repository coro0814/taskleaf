class TaskMailer < ApplicationMailer
  default from: 'tkmk2nr2@gmail.com'

  def creation_email(task)
    @task = task
    mail(
      subject: 'タスク作成完了メール！',
      to: 'coro.0814.coro@gmail.com'
    )
  end
end
