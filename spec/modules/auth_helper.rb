module AuthHelper
    def auth_headers(user)
      post user_session_path, params:  { email: user.email, password: 'password' }
      response.headers.slice('Authorization')
    end
  end