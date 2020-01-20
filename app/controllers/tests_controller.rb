class TestsController < Simpler::Controller
  def index
    @time = Time.now
    @tests = Test.all
  end

  def show
    @test = Test[params['id']]
  end

  def create; end
end
