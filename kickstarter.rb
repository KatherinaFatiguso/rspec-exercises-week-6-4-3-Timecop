# EXERCISE 6.4.3
# Write a class and spec to represent a kickstarter campaign.
# You should define a method called completed?
# which is true if the current time is more than 10 days from commencement.

class Kickstarter
  attr_accessor :title, :start
  DAY = 24 * 60 * 60

  def initialize(title)
    @title = title
  end

  def start_campaign!
    @start = Time.now
  end

  #which is true if the current time is more than 10 days from commencement.
  def completed?
    (@start + 10 * DAY) < Time.now
    # p (@start + 10 * DAY)
  end


end
=begin
test = Kickstarter.new('blah')
puts "start campaign #{test.start_campaign!}"
puts "completed #{test.completed?}"
=end
