namespace Quantum.BellTest
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    
    operation HelloQ () : Unit {
        Message("Hello quantum world!");
    }

	operation Set(desired: Result, q1: Qubit): Unit {
		body {
			let current = M(q1);
			if (desired != current)
			{
				X(q1);
			}
		}
	}

	operation BellTest(count: Int, inital: Result): (Int, Int, Int) {
		body {
			mutable numOnes = 0;
			mutable agree = 0;
			using(qubits = Qubit[2]) {
				for (test in 1..count) {
					Set(inital, qubits[0]);
					Set(Zero,qubits[1]);

					H(qubits[0]);
					CNOT(qubits[0],qubits[1]);
					let res = M(qubits[0]);
					if (M(qubits[1])==res)
					{
						set agree = agree + 1;
					}
					if (res == One) {
						set numOnes = numOnes +1;
					}
					
				}
				Set(Zero, qubits[0]);
				Set(Zero, qubits[1]);
			}
			return (count - numOnes, numOnes, agree);
		}
	}
}
