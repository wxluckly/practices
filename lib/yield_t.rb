def fibUpTo(max)
  i1,i2=1,1 #parallel assignment
  while i1<=max
    yield i1
    i1, i2 =i2,i1+i2
  end
end

fibUpTo(1000){|f| puts f," "}


fibUpTo(1)