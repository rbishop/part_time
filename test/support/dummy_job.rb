class DummyJob
  include ::PartTime::Job

  def perform(*args)
    args
  end
end
