class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def build_resource(hash=nil)
    super(hash)
    resource.build_pantry
  end
end