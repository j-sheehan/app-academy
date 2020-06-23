class Code
  ### Class variables ###
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  ### Class Methods ###
  def self.valid_pegs?(chars_array)
    chars_array.all? { |char| POSSIBLE_PEGS.keys.include?(char.upcase) }
  end

  def self.random(length)
    rand_pegs = []

    length.times do |i|
      rand_pegs << POSSIBLE_PEGS.keys[rand(POSSIBLE_PEGS.length)]
    end

    Code.new(rand_pegs)
  end

  def self.from_string(pegs_str)
    Code.new(pegs_str.split(""))
  end

  ### Init method ###
  attr_reader :pegs

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "error: not valid pegs"
    end
  end

  ### Instance methods ###

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_instance)
    count = 0

    code_instance.pegs.each_with_index do |peg, idx| 
      count += 1 if @pegs[idx] == peg
    end

    count
  end

  def num_near_matches(code_instance)
    count = 0

    code_instance.pegs.each_with_index do |peg, idx|
      count += 1 if @pegs[idx] != peg && @pegs.include?(peg)
    end

    count
  end

  def ==(code_instance)
    self.pegs == code_instance.pegs
  end

end
