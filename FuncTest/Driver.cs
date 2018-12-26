using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.FuncTest
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                HelloFunTest.Run(qsim).Wait();
                var tempInt = AddInt.Run(qsim, 3, 3).Result;
                Console.WriteLine("AddInt"+tempInt);
                var tempDouble = ProductNumber.Run(qsim, 3, 3).Result;
                Console.WriteLine("ProductDouble" + tempDouble);
                Console.ReadLine();
            }
        }
    }
}