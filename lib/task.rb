class Task
  include Schema::DataStructure

  attribute :id, String
  attribute :name, String
  attribute :added_time, Time
  attribute :completed_time, Time
  attribute :removed_time, Time

  def completed?
    !completed_time.nil?
  end

  def complete(time)
    self.completed_time = time
  end

  def mark_incomplete
    self.completed_time = nil
  end

  def remove(time)
    self.removed_time = time
  end

  def removed?
    !removed_time.nil?
  end
end
