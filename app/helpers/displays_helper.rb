module DisplaysHelper

  # This crazy code is used to reduce a two level hash based on the second level values.
  # Practically, we use this to limit the number of unique custom icons that are displayed
  # on a static image map.  The hash data-structure is a two level hash (color > heading) 
  # holding an array, that looks like this:
  # - red:
  # -- 90: [bus 1, bus 2]
  # --100: [bus 3, bus 4]
  # - blue:
  # -- 10: [bus 5]
  # The idea is to reduce this dataset to max level1-level2 pairs, so from red-90, red-100, blue-10
  # to something like red-95, blue-10 (if max = 2).
  def double_hash_reduce(hash, max)
    while hash.values.collect{|v| v.length}.inject(0){|sum,item| sum + item} > max:
      diff = 1.0/0  # Hold the difference for an in-place identification
      l1 = nil # The first tier value we're going to be reducing in
      l2 = [] # The two second tier values we're going to combine
      hash.each do |key, value|
        l1_keys = value.keys
        l1_keys.sort!
        for i in (1...(l1_keys.length)) do
          t_diff = l1_keys[i] - l1_keys[i-1]
          if t_diff < diff
            diff = t_diff
            l1 = key
            l2 = [l1_keys[i-1], l1_keys[i]]
          end
        end
      end

      # Now do the reduce step.
      new_l2 = ((l2[0] + l2[1])/2).to_i
      combined = hash[l1][l2[0]] + hash[l1][l2[1]]
      hash[l1].delete(l2[0])
      hash[l1].delete(l2[1])
      hash[l1][new_l2] = combined
    end
    return hash
  end
  
end