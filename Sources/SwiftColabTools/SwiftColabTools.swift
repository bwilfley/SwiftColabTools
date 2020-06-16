import Foundation

public func normMarsaglia( ) -> Double {
  var S = 1.1
  var U = Double()
  var V = Double()
  while( S >= 1.0) {
    U = Double.random(in: -1..<1)
    V = Double.random(in: -1..<1)
    S = U*U + V*V
    //print(S)
  }
  return U * sqrt((-2.0 * log(S))/S)
}

public func norm6Uniform() -> Double {
  let numSamp = 6
  var sum = 0.0
  for k in 0..<numSamp {
    sum += Double.random(in: 0..<1)
  }
  return (sum - Double(numSamp)/2)
}

public func fzero(fun: (Double)->Double, xzero: Double, xone: Double) -> Double {
  let eps = 1e-6
  var x0 = xzero
  var x1 = xone
  var y0 = fun(x0)
  var y1 = fun(x1)
  /*if y0 * y1 >= 0 {
    print( "ERROR")
    return x0
  }*/
  var m = (y1 - y0)/(x1 - x0)
  var besty = min( abs(y0), abs(y1))
  var bestx = x0
  while besty > eps {
    if abs(y1) > abs(y0) {
      x1 = -y0 / m + x0
      if x1 < -0.3 {x1 = -0.3}
      y1 = fun(x1)
      m = (y1 - y0)/(x1 - x0)
      besty = min( abs(y0), abs(y1))
      bestx = x1
    } else {
      x0 = -y1 / m + x1
      if x0 < -0.3 {x0 = -0.3}
      y0 = fun(x0)
      m = (y1 - y0)/(x1 - x0)
      besty = min( abs(y0), abs(y1))
      bestx = x0
    }
    print( bestx)
  }
  return bestx
}

// A timing tool
public func deltaT(begin: Date) -> Double {
  let now = DateInterval(start: begin, end: Date())
  return Double(now.duration)
}

// Vector tools
public func vecDZeros(n: Int) -> [Double] {
  return Array( repeating: 0.0, count: n)
}

public func vecIZeros(n: Int) -> [Int] {
  return Array( repeating: 0, count: n)
}

public func vecsAdd(v1: [Double], v2: [Double]) -> [Double] {
  return zip(v1, v2).map(+)
}

public func vecsSubtr(vp: [Double], vn: [Double]) -> [Double] {
  return zip(vp, vn).map(-)
}

public func vecsProd(v1: [Double], v2: [Double]) -> [Double] {
  return zip(v1, v2).map(*)
}

public func vecSqr(v: [Double]) -> [Double] {
  return vecsProd(v1: v, v2: v)
}

public func vecSum(v: [Double]) -> Double {
  return v.reduce(0.0, +)
}

public func vecMean(v: [Double]) -> Double {
  return vecSum(v: v) / Double(v.count)
}

public func vecSDev(v: [Double]) -> Double {
  let vbar = vecMean(v: v)
  let v2bar = vecMean(v: vecSqr(v: v))
  let n = v.count
  return sqrt((v2bar - vbar * vbar) * Double(n) / Double((n-1)))
}
