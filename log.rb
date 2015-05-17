class Log
  attr_reader :message, :logged_at

  def initialize(message)
    @message = message
    @logged_at = Time.now
  end
end
