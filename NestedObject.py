
listone = ["A", "B", ["C1", "C2", ["D1", "D2"]]]

def myFun(x=0, y=0, z=0):
  return listone[x][y][z]


print(myFun(2,2,1))
