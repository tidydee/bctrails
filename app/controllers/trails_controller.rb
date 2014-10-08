class TrailsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create]
  before_filter :trail, only: [:show, :edit, :update, :destroy]

  def index
    @trails = Trail.all
  end

  def show #get: viewing the show page
  end

  def new #post
  	@trail = Trail.new
  end

  def create #post
    @trail = Trail.new(trail_param)
    if @trail.save
      redirect_to trail_path(@trail)
    else
      render :new
    end
  end

	def edit #get: viewing the edit page
	end

	def update #post
    if @trail.update_attributes(trail_param)
      redirect_to :show
    else
      render :edit
    end
	end

  def destroy #post
    if @trail.destroy
      redirect :index
    else
      render :show
    end
  end

  private
  
    def trail
      @trail = Trail.find(params[:id])
    end

    def trail_param
      params.require(:trail).permit([:name, :street, :city, :postal_code])
    end

end
