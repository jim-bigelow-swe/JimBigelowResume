require 'tsort'

class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

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
      render :text => solve_puzzle(params[:d])

    else
      render :text => "OK"
    end
  end

  def solve_puzzle(challenge)
    puzzle = challenge.gsub("Please solve this puzzle:\n", "")
    pieces = puzzle.split("\n")

    letters =["", "A", "B", "C", "D"]
    # construct the graph based in the challenge
    graph = Hash.new
    for i in 1..4
      graph[letters[i]] = Array.new
    end
    pieces.each do |piece|
      if piece =~ /^[A-D]/
        letter = piece[0]
        for i in 1..4
          if piece[i] =~ /</
            graph[letter] = graph[letter] << letters[i]
          elsif piece[i] =~ />/
            graph[letters[i]] = graph[letters[i]] << letter
          end
        end
      end
    end
    # find the partial ordering using a toplogical sort
    order = graph.tsort

    # construct the solution, by filling in the blanks
    solution = {
      :title => " ABCD",
      :A     => "A=   ",
      :B     => "B =  ",
      :C     => "C  = ",
      :D     => "D   ="
    }
    column = {:A => 1, :B => 2, :C => 3, :D => 4}
    # for each letter in order
    for i in 0..3
      greater = order[i]
      j = i
      # for every letter that goes after this letter
      # i.e. is left is greater than right
      until j > 3
        lesser = order[j]

        #set greater > lesser
        if greater != lesser
          #greater > lesser
          solution[greater.to_sym][column[lesser.to_sym]] = '>'
          #lesser < greater
          solution[lesser.to_sym][column[greater.to_sym]] = '<'
        end

        j += 1
      end

    end

    answer="\n#{solution[:title]}\n#{solution[:A]}\n#{solution[:B]}\n#{solution[:C]}\n#{solution[:D]}\n"
  end

end
