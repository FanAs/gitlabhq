require "spec_helper"

describe AuthHelper do
  describe "button_based_providers" do
    it 'returns all enabled providers from devise' do
      allow(helper).to receive(:auth_providers) { [:twitter, :github] }
      expect(helper.button_based_providers).to include(*[:twitter, :github])
    end

    it 'does not return ldap provider' do
      allow(helper).to receive(:auth_providers) { [:twitter, :ldapmain] }
      expect(helper.button_based_providers).to include(:twitter)
    end

    it 'returns empty array' do
      allow(helper).to receive(:auth_providers) { [] }
      expect(helper.button_based_providers).to eq([])
    end
  end

  describe 'enabled_button_based_providers' do
    before do
      allow(helper).to receive(:auth_providers) { [:twitter, :github] }
    end

    it 'returns all the enabled providers from settings' do
      expect(helper.enabled_button_based_providers).to include(*['twitter', 'github'])
    end

    it "should not return github as provider because it's disabled from settings" do
      stub_application_setting(
        disabled_oauth_sign_in_sources: ['github']
      )

      expect(helper.enabled_button_based_providers).to include('twitter')
      expect(helper.enabled_button_based_providers).to_not include('github')
    end

    it 'returns true for button_based_providers_enabled? because there providers' do
      expect(helper.button_based_providers_enabled?).to be true
    end

    it 'returns false for button_based_providers_enabled? because there providers' do
      stub_application_setting(
        disabled_oauth_sign_in_sources: ['github', 'twitter']
      )

      expect(helper.button_based_providers_enabled?).to be false
    end
  end
end
