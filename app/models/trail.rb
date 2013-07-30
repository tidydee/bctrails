class Trail < ActiveRecord::Base

  acts_as_gmappable

  def gmaps4rails_address
    "#{street}, #{city}, Canada , #{postal_code}"
  end

end
