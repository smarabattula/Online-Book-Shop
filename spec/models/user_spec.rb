
require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username)}
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