def gcd(u, v)
  u, v = u.abs, v.abs
  while v != 0
    u, v = v, u % v
  end
  u
end

if __FILE__ == $0
	puts gcd(6,3)
end
