namespace Quantum.FuncTest
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    
    operation HelloFunTest () : Unit {
        Message("Hello quantum!");
    }
	operation AddInt(a: Int, b: Int): Int {
		body {
			mutable c = 0;
			set c = a + b;
			return (c);
		}
	}
	function ProductNumber(a: Double, b:Double):Double {
		mutable c = 0.0;
		set c = a * b;
		return (c);
	}
	
}
