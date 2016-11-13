# in lib/array .rb
class Array
  attr_accessor :mem

  def sort_as_string
    map { |x| x.to_s }.sort
  end

  def pop_to_mem!
    @mem = pop
  end

  def push_from_mem!
    if @mem != nil
      push @mem
      @mem = nil
    end
  end

  def give_mem(arr)
    if @mem != nil
      arr.push @mem
      @mem = nil
    end
  end

  def except_class(c)
    n = []
    each do |e|
      if e.class == c
        n.push e
      end
    end
    n
  end

  def replace_each_odd_spot(val)
    o = 0
    each do |e|
      if o.odd?
        self[o] = val
      end
      o += 1
    end
  end
end
