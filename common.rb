module TaskLibrary
  class Task
    def run()
    end
  end
  
  class Server
    def run_task(task)
      if not task.respond_to? :run
        puts "Received invalid task!" 
        return
      end
      puts "Running sent task at #{Time.now}..."
      task.run()
      puts "Finished running task."
    end
  end
end
