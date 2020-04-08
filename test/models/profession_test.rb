# frozen_string_literal: true

require 'test_helper'

class ProfessionTest < ActiveSupport::TestCase
  test 'should create profession' do
    profession = build :profession
    profession.save

    created_profession = Profession.last
    assert created_profession
  end

  test 'should not create profession with title lenght > 50' do
    profession = build :profession, title: 'String' * 10
    profession.save

    created_profession = Profession.last
    assert_not created_profession
  end

  test 'should not create profession with not a valid state' do
    profession = build :teacher, state: 'die'
    profession.save

    created_profession = Profession.last
    assert_not created_profession
  end
end
