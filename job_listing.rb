# EXERCISE 6.4.3
# Write a spec for the expired? method on JobListing


  class JobListing
    attr_accessor :title
    DAY = 24 * 60 * 60

    def initialize(title)
      @title = title
    end

    def publish!
      @published_at = Time.now
      @expires_at = @published_at + 30 * DAY
    end

    def expired?
      @expires_at < Time.now
    end

    def completed? #which is true if the current time is more than 10 days from commencement.
      Time.now > @published_at + 10 * DAY
    end
  end
