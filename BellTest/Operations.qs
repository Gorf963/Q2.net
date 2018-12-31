﻿namespace Quantum.BellTest
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

	operation BellTest(count: Int, inital: Result): (Int, Int) {
		body {
			mutable numOnes = 0;
			using(qubits = Qubit[1]) {
				for (test in 1..count) {
					Set(inital, qubits[0]);
					
					//let res = M(qubits[0]);
					H(qubits[0]);
					let res = M(qubits[0]);
					if (res == One) {
						set numOnes = numOnes +1;
					}
				}
				Set(Zero, qubits[0]);
			}
			return (count - numOnes, numOnes);
		}
	}
}