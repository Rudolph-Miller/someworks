class Article < ActiveRecord::Base
	extend Enumerize
  default_scope {where(:deleted_at => nil)}

	enum status: {writing:0, finished_writing:1, keeping:2, editing:3, finished_editing:4}

  belongs_to :writer
  belongs_to :assigned_task
  has_many :pictures

  def assigned_task_info ()
    self.assigned_task.task
  end

  def task_title ()
    self.assigned_task.task.title
  end
end
