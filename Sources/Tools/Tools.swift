struct SwiftColabTools {
    var text = "Hello, World!"
}

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
