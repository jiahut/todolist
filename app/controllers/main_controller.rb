class MainController < ApplicationController
  def index
    @user = User.find(session['current_user'])
    @tasks = Task.find(:all)
  end
end
