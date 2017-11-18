class Task
  class Projection
    include EntityProjection

    entity_name :task

    apply Messages::Events::Added do |added|
      task.id = added.task_id
      task.name = added.name

      added_time_iso8601 = added.time
      added_time = Time.parse(added_time_iso8601)

      task.added_time = added_time
    end

    apply Messages::Events::Completed do |completed|
      completed_time_iso8601 = completed.time
      completed_time = Time.parse(completed_time_iso8601)

      task.complete(completed_time)
    end

    apply Messages::Events::MarkedIncomplete do |marked_incomplete|
      task.mark_incomplete
    end

    apply Messages::Events::Removed do |removed|
      removed_time_iso8601 = removed.time
      removed_time = Time.parse(removed_time_iso8601)

      task.remove(removed_time)
    end
  end
end
