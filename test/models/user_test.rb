require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new first_name: 'First name', last_name: 'Last name', birthday: Date.today, address: 'Address'
    assert user.valid?
  end

  test 'invalid without first_name' do
    user = User.new first_name: '', last_name: 'Last name', birthday: Date.today, address: 'Address'
    assert_not user.valid?
  end

  test 'invalid without last_name' do
    user = User.new first_name: 'First name', last_name: '', birthday: Date.today, address: 'Address'
    assert_not user.valid?
  end

  test 'invalid without birthday' do
    user = User.new first_name: '', last_name: 'Last name', birthday: nil, address: 'Address'
    assert_not user.valid?
  end

  test 'invalid without address' do
    user = User.new first_name: 'First name', last_name: 'Last name', birthday: Date.new, address: ''
    assert_not user.valid?
  end
end
