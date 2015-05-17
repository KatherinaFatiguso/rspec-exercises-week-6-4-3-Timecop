# rspec for kickstarter_spec.rb
require '../kickstarter'
require 'rspec/its'
require 'timecop'


RSpec.describe Kickstarter do
  before { Timecop.freeze(Time.now) }
  subject! (:campaign) { Kickstarter.new('KMart Toy Sale') }

  its(:title) {is_expected.to eq('KMart Toy Sale') }


  describe '#start_campaign!' do

    context "shows the start time is at the creation time" do
      before { Timecop.freeze(Time.now) }
      subject { campaign.start_campaign!}
      it { is_expected.to eq(Time.now) }
    end
  end

  describe '#completed?' do
    context "true if the time now is 10 days after the start." do
      before { Timecop.freeze(Time.now) }
      before { campaign.start_campaign!} #first initialize the start time
      before { campaign.completed?} #completed? depends on the start_campaign!
      before { Timecop.travel(Time.now + 10 * 24 * 60 * 60 + 1) }
      it { is_expected.to be_completed }
    end
  end
end
