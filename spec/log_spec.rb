require '../log'
require 'rspec/its'
require 'timecop'

RSpec.describe Log do
  before          { Timecop.freeze(Time.now)}
  subject         { Log.new('Something happened') }
  its(:message)   { is_expected.to eq('Something happened') }
  its(:logged_at) { is_expected.to eq(Time.now) }
end
