class TestsController < Simpler::Controller
  def index
    @time = Time.now
    @tests = Test.all
  end

  def show
    # @tests = Test.all
    # render 'tests/index'

    # status 222
    # headers['Content-Type'] = 'text/plain'

    @test = Test[params['id']]

    # render plain: 'Plain renderer'
    # render html: '<h1>Plain renderer<h1/>'
    # render js: "alert('Hello Rails');"
    # render json: { 'iam' => 'json' }
    # render xml: { lower_camel_case: 'key' }
  end

  def create; end
end
