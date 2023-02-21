
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

    context "when user is not admin" do
      subject(:user) {FactoryBot.build(:user)}
      it "has false on is_admin" do
        expect(user.is_admin).to eq(false )
      end
    end

    context "when user is admin" do
      subject(:admin) {FactoryBot.build(:user,:admin)}
      it "has true on is_admin" do
        expect(admin.is_admin).to eq(true)
      end
    end
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