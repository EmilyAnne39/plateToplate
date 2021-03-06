class InterestsController < ApplicationController

  def new
    @interest = Interest.new
    @user = current_user
  end

  def edit
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to interests_path, notice: "You have successfully created a interest!"
    else
      render :new
    end
  end

  def update
    if @interest.update(interest_params)
      format.html {redirect_to interests_path, notice: "interest was successfully updated."}
    else
      format.html {render :edit}
    end
  end

  def destroy
    @interest.destroy
    redirect_to interests_path
  end

  private

  def interest_params
    params.require(:interest).permit(:user_id,:cuisine_id,:teach,:learn)
  end

end
