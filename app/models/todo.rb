class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list_name, :todo_count, :status
  before_save {  self.list_name =self.list_name.gsub(" ", "-").downcase }

  @@statuses = { 0 => :incomplete,
               1 => :complete,
               2 => :in_progress,
               3 => :moved,
               4 => :deleted,
               5 => :postponed,
               6 => :important }

  def status?
   @@statuses[self.status]
  end

  def set_status(status)
    self.update_attribute(:status, @@statuses.key(status))
  end


  class << self

    def all_with_status(status)
      self.where(:status == @@statuses.key(status))
    end

    def create_by(status)
      self.create(status: @@statuses.key(status))
    end
  end

end
