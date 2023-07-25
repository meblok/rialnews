class ApplicationController < ActionController::Base
    def authorized_request(kind = nil)
        if current_user
          unless kind.include?(current_user.role)
            redirect_to publications_path, 
            notice: "Solo el administrador puede realizar esta acción"
          end
        else
          redirect_to publications_path,
          notice: "Debes iniciar sesión como administrador"
        end
      end
end
