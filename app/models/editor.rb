class Editor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  include TaskCreatable
  include TaskDeletable

  has_many :assigned_tasks
  has_many :tasks, :as => :task_creatable

  validates :name, presence: true

  def assigned_tasks_list
    result = []
    self.assigned_tasks.each do |atask|
      result << atask.task
    end
    result
  end

  def keeping (params)
    article = Article.where(:id => parms[:id]).first
    if article.status == 'finished_writing'
      article.status = 'keeping'
    end
  end

  def editing (params)
    article = Article.where(:id => parms[:id]).first
    if article.status == 'keeping' || article.status == 'finished_editing'
      article.status == 'editing'
    end
  end

  def finish (params)
    article = Article.where(:id => params[:id]).first
    if article.status == 'editing'
      article.status == 'finish'
    end
  end
end
