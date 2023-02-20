
require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username)}
    it { should validate_presence_of(:email) }
    it { should allow_value('example@google.com').for(:email) }
    it { should_not allow_value('not email format').for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    end

  describe 'associations' do
    it { should have_many(:transactions).dependent(:destroy) }
    it { should have_many(:reviews).dependent(:destroy) }
  end

  describe 'has_secure_password' do
    let(:user) { FactoryBot.build(:user) }
    it 'encrypts the password' do
      expect(user.password_digest).not_to be_nil
    end
  end
end