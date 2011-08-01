class HTMLValidity
  VALID = 1
  INVALID = 2
  UNKNOWN = 3
  
  def initialize(state)
    @state = state
  end

  def state
    @state
  end

  def ==(other)
    (other.instance_of? HTMLValidity) && other.state == @state
  end

  def to_s
    case @state
      when VALID 
        :ok
      when INVALID 
        :ok
      else 
        :unknown
    end
  end

end
