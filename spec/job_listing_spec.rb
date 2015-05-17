# rspec for job_listing.rb
require '../job_listing'
require 'rspec/its'
require 'timecop'


RSpec.describe JobListing do
  subject { JobListing.new('Ruby Developer') }
  before { subject.publish! }

  describe '#expired?' do
    # do not use sleep method, it will make you wait for actual 30 days to complete the program
    # sleep(30 * 24 * 60 * 60)
    # Travel 30 days and 1 second using Timecop.travel()
    before { Timecop.travel(Time.now + 30 * 24 * 60 * 60 + 1) }
    it { is_expected.to be_expired }
  end

  describe '#completed?' do
    #which is true if the current time is more than 10 days from commencement.
    before { Timecop.travel(Time.now + 10 * 24 * 60 * 60) }
    it { is_expected.to be_completed }
  end
end
