# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      name: 'Felix',
      password: 'some_password',
      email: 'felix@doe.com'
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
