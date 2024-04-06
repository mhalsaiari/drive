# test/controllers/api/v1/users_controller_test.rb

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionController::TestCase
      test 'should create user with valid parameters' do
        assert_difference('User.count', 1) do
          post :create, params: { user: { email: 'test@example.com', password: 'password' } }
        end
        assert_response :created
      end

      test 'should not create user with invalid parameters' do
        assert_no_difference('User.count') do
          post :create, params: { user: { email: '', password: '' } }
        end
        assert_response :unprocessable_entity
      end
    end
  end
end
