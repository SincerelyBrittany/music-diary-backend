class Api::V1::SessionsController < ApplicationController
        def create
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                token = encode_token(user.id)
                render json: {user: UserSerializer.new(user), token: token}
            else
                render json: {errors: "Either your username or password was incorrect. Please try again."}
            end
        end
      

        def get_current_user
            # render json: {user: UserSerializer.new(logged_in_user)}
            user = session_user
            if logged_in_user
                token = encode_token(user.id)
                render json: {user: UserSerializer.new(user), token: token}
            else
                render json: {errors: "Not the user!"}
            end
        end

        def destroy
            session.clear
            render json: {
              notice: "successfully logged out"
            }, status: :ok
          end
end
