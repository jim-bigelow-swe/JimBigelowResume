require "spec_helper"

describe HomeController do
  describe "Get index?Ping" do
    it 'should accept the parameter Ping' do
      get 'index', {:q => "Ping"}
    end
    it 'should respond OK' do
      get 'index', {:q => "Ping"}
      response.body.should == "OK"
    end
  end
  describe "Get index?Name" do
    it 'should accept the parameter Name' do
      get 'index', {:q => "Name"}
    end
    it 'should respond "Jim Bigelow"' do
      get 'index', {:q => "Name"}
      response.body.should == "Jim Bigelow"
    end
  end
  describe "Get index?Email Address" do
    it 'should accept the parameter Address' do
      get 'index', {:q => "Email Address"}
    end
    it 'should respond "jim.bigelow.swe@gmail.com"' do
      get 'index', {:q => "Email Address"}
      response.body.should == "jim.bigelow.swe@gmail.com"
    end
  end
  describe "Get index?Phone" do
    it 'should accept the parameter Phone' do
      get 'index', {:q => "Phone"}
    end
    it 'should respond "208-629-0321" ' do
      get 'index', {:q => "Phone"}
      response.body.should == "208-629-0321"
    end
  end
  describe "Get index?Position" do
    it 'should accept the parameter Position' do
      get 'index', {:q => "Position"}
    end
    it 'should respond "Senior Software Developer, Boise, ID" ' do
      get 'index', {:q => "Position"}
      response.body.should == "Senior Software Developer, Boise, ID"
    end
  end
  describe "Get index?Years" do
    it 'should accept the parameter Years' do
      get 'index', {:q => "Years"}
    end
    it 'should respond "20" ' do
      get 'index', {:q => "Years"}
      response.body.should == "20"
    end
  end
  describe "Get index?Referrer" do
    it 'should accept the parameter Referrer' do
      get 'index', {:q => "Referrer"}
    end
    it 'should respond "indeed.com" ' do
      get 'index', {:q => "Referrer"}
      response.body.should == "indeed.com"
    end
  end
  describe "Get index?Degree" do
    it 'should accept the parameter Degree' do
      get 'index', {:q => "Degree"}
    end
    it 'should respond with degree info ' do
      get 'index', {:q => "Degree"}
      response.body.should == %q{
Master of Science, Computer Science, Algorithms and Data Structures
The National Technological University, Fort Collins, Colorado

Bachelor of Science, Computer Science,
Portland State University, Portland, Oregon}
    end
  end
  describe "Get index?Resume" do
    it 'should accept the parameter Resume' do
      get 'index', {:q => "Resume"}
    end
    it 'should respond "http://blooming-gorge-2274.herokuapp.com/resume" ' do
      get 'index', {:q => "Resume"}
      response.body.should == "http://blooming-gorge-2274.herokuapp.com/resume"
    end
  end
  describe "Get index?Source" do
    it 'should accept the parameter Source' do
      get 'index', {:q => "Source"}
    end
    it 'should respond "https://github.com/jim-bigelow-swe/JimBigelowResume.git" ' do
      get 'index', {:q => "Source"}
      response.body.should == "https://github.com/jim-bigelow-swe/JimBigelowResume.git"
    end
  end
  describe "Get index?Status" do
    it 'should accept the parameter Status' do
      get 'index', {:q => "Status"}
    end
    it 'should respond "Yes, I am a US citizen" ' do
      get 'index', {:q => "Status"}
      response.body.should == "Yes, I am a US citizen"
    end
  end
  describe "Get index?Puzzle" do
    before(:each) do
      @test_data = {:puzzle => {"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA-->-\nB>---\nC--=-\nD--<-\n"}, :solution => "\n ABCD\nA=<>>\nB>=>>\nC<<=>\nD<<<=\n"}
    end
    it 'should accept the parameter Puzzle' do
      get 'index', @test_data[:puzzle]
    end
    it 'should respond with a Puzzle solution' do
      get 'index', @test_data[:puzzle]
      response.body.should == @test_data[:solution]
    end
  end
end
