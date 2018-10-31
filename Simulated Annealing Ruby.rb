def randomfloat(min,max)
  return rand()*(max-min)+min
end

def rumus(x1,x2)
  return -(Math.sin(x1)*Math.cos(x2)*Math.exp((1-Math.sqrt(x1**2+x2**2)/Math::PI).abs)).abs
end

def random2(x)
  y=x+randomfloat(-2,2)
  if y>10 or y<-10
    random2(x)
  else
    return y
  end
end

# solusi sementara
x1=randomfloat(-10,10)
x2=randomfloat(-10,10)

# nilai evaluasi sementara
nilai = rumus(x1,x2)

#T atau suhu
t = 100

while t>0.000000001
    x1baru = random2(x1)
    x2baru = random2(x2)

    nilaibaru = rumus(x1baru,x2baru)

    if (nilaibaru<nilai)
      nilai=nilaibaru
      x1 = x1baru
      x2 = x2baru
      nilaiterbaik = nilaibaru
    else
      delta = nilaibaru-nilai
      if Math.exp(-delta/t) > rand(0..1)
        nilai = nilaibaru
        x1 = x1baru
        x2 = x2baru
      end
    end

  t = 0.99999*t

  puts "#{t} x1: #{x1} x2: #{x2} --> #{nilai}"
end

#akurasi dari nilai optimum yang pernah didapat
#puts "#{nilaiterbaik/-19.208502329538586*100} %"
puts nilaiterbaik
