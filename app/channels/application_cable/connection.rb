module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_profile

    def connect
      self.current_profile = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed['user.id'])
        if verified_user.sign_up_as == 'tutor'
          verified_user.tutor_profile
        elsif verified_user.sign_up_as == 'student'
          verified_user.student_profile
        else
          verified_user
        end
      else
        reject_unauthorized_connection
      end
    end
  end
end
