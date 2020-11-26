module States
  class Continue < Base
    def render
      if File.file?(file) && !File.zero?(file)
        IOAdapter.deserialize(application_context.valeron, File.open('continue.json').readline)
        application_context.message = 'The old Valera.'
      else
        application_context.message = 'The old Valera is gone. Have to start a new life.'
      end
    end

    def next
      step_play
    end

    def file
      @file = 'continue.json'
    end
  end
end
