class HomeController < ApplicationController
  def index
    #debugger
    if params[:q] =~ /Ping/
      render :text => "OK"

    elsif params[:q] =~ /Name/
      render :text => "Jim Bigelow"

    elsif params[:q] =~ /Email Address/
      render :text => "jim.bigelow.swe@gmail.com"

    elsif params[:q] =~ /Phone/
      render :text => "208-629-0321"

    elsif params[:q] =~ /Position/
      render :text => "Senior Software Developer, Boise, ID"

    elsif params[:q] =~ /Years/
      render :text => "20"

    elsif params[:q] =~ /Referrer/
      render :text => "indeed.com"

    elsif params[:q] =~ /Degree/
      render :text => %q{
Master of Science, Computer Science, Algorithms and Data Structures
The National Technological University, Fort Collins, Colorado

Bachelor of Science, Computer Science,
Portland State University, Portland, Oregon}

    elsif params[:q] =~ /Resume/
      render :text => "http://blooming-gorge-2274.herokuapp.com/resume"

    elsif params[:q] =~ /Source/
      render :text => "https://github.com/jim-bigelow-swe/JimBigelowResume.git"

    elsif params[:q] =~ /Status/
      render :text => "Yes, I am a US citizen"

    elsif params[:q] =~ /Puzzle/
      render :text => %q{ ABCD
A=<>>
B>=>>
C<<=>
D<<<=}

    else
      render :text => "OK"
    end
  end
end
