class TestsController < Simpler::Controller
  def index
    @time = Time.now
    @tests = Test.all
  end

  def show
    status 222
    headers['Content-Type'] = 'text/plain'

    @test = Test[params['id']]
  end

  def create; end
end
