module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
      respond_to :json
      
      def create
        warden.authenticate!(:scope => resource_name, :recall => '#{controller_path}#failure')
        render :json => { :success => true, :info => 'Logged in', :data => { :auth_token => current_user.authentication_token } }, status: :ok
      end
      
      def destroy
        warden.authenticate!(:scope => resource_name, :recall => '#{controller_path}#failure')
        current_user.update_column(:authentication_token, nil)
        render :json => { :success => true, :info => 'Logged out', :data => {} }, status: :ok
      end
      
      def failure
        render :json => { :success => false, :info => 'Login failure', :data => {} }, status: :unauthorized
      end
      
    end  
  end
end
