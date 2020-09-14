# clock_test.rb
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/clock.rb'

Minitest::Reporters.use!

describe "clock" do
  it "will return a string" do
    #Arrange
    hours = 8
    minutes = 14
    seconds = 27

    #Act
    time = clock(hours, minutes, seconds)

    #Assert
    # the 'clock' method must return a string
    expect(time).must_be_instance_of String
  end

  it "will return a string formatted in hh:mm:ss format" do
    #Arrange
    hours = 11
    minutes = 14
    seconds = 27

    #Act
    time = clock(hours, minutes, seconds)

    #Assert
    # the 'clock' method must return a string
    expect(time).must_equal "11:14:27"
  end

  it "will display leading zeros for numbers smaller than 10" do
    time = clock(11, 8, 14)
    expect(time).must_equal "11:08:14"

    time = clock(8, 11, 14)
    expect(time).must_equal "08:11:14"

    time = clock(11, 14, 8)
    expect(time).must_equal "11:14:08"
  end

  it "will raise an error when given an invalid argument" do
    expect {
      clock(25, 14, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, 60, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, 8, 60)
    }.must_raise ArgumentError

    expect {
      clock(-20, 8, 14)
    }.must_raise ArgumentError

    expect {
      clock(14, -20, 8)
    }.must_raise ArgumentError

    expect {
      clock(8, 14, -20)
    }
  end


end