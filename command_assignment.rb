  class Command
    def execute
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end

  class CreateUserCommand < Command
    def initialize(user_service)
      @user_service = user_service
    end
  
    def execute
      @user_service.create_user
    end
  end
  
  class DeleteUserCommand < Command
    def initialize(user_service)
      @user_service = user_service
    end
  
    def execute
      @user_service.delete_user
    end
  end
  
  class UserService
    def create_user
      puts 'UserService: Creating a user.'
    end
  
    def delete_user
      puts 'UserService: Deleting a user.'
    end
  end
  
  class UserController
    def initialize
      @on_create = nil
      @on_delete = nil
    end
  
    def on_create=(command)
      @on_create = command
    end
  
    def on_delete=(command)
      @on_delete = command
    end

    def create_user
      puts 'UserController: Creating a user...'
      @on_create.execute if @on_create.is_a? Command
    end

    def delete_user
      puts 'UserController: Deleting a user...'
      @on_delete.execute if @on_delete.is_a? Command
    end
  end

user_service = UserService.new
user_controller = UserController.new

create_user_command = CreateUserCommand.new(user_service)
delete_user_command = DeleteUserCommand.new(user_service)

user_controller.on_create = create_user_command
user_controller.on_delete = delete_user_command

user_controller.create_user
user_controller.delete_user
  