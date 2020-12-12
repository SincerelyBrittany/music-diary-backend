class ApplicationController < ActionController::API
    def get_auth_token
        request.headers["Authorization"]
    end

    def decode_token
        begin
            JWT.decode(get_auth_token, ENV["JWT_KEY"])[0]["user_id"]
        rescue
            nil
        end
    end

    def session_user
        User.find_by_id(decode_token)
    end

    def logged_in_user
        User.find_by_id(decode_token)
    end

    def encode_token(id)
        JWT.encode({user_id: id}, ENV["JWT_KEY"])
    end
end
