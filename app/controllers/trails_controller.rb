class TrailsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create]


def index
    @trails = Trail.find(:all)
end

def show
  @trail = Trail.find(params[:id])
end


	def create
      @trail = Trail.new(params.require(:trail).permit([:name, :street, :city, :postal_code]))
      if @trail.save
            redirect_to :action => 'index'
      else
            @trail = Trail.find(:all)
            render :action => 'new'
      end
	end

	def new
		@trail = Trail.new
	end

	def edit
    @trail = Trail.find(params[:id])
	end

	def update
   
	end

	def destroy
	end

end
