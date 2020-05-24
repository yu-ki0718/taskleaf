class ApplicationController < ActionController::Base

    helper_method :current_user
    before_action :login_required

    rescue_from ActionController::RoutingError, with: :render_404

    def render_404
        logger.debug(9999)
        render template: 'errors/error_404', status: 404, layout: 'application',  content_type: 'text/html'
    end

    private

    def current_user
        @current_user ||= User.find_by(:id session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to login_path unless current_user
    end

end
