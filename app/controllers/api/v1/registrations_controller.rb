class Api::V1::RegistrationsController < Devise::RegistrationsController


  respond_to :json

  def create
    build_resource
    # resource.email = params[:email]
    # resource.password = params[:password]
    #resource.skip_confirmation!
    #byebug
    if resource.save
      sign_in resource
      render :status => 200,
             :json => { :success => true,
                        :info => "Registered",
                        :data => { :user => resource } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end
end