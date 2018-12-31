using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.BellTest
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                Result inital = new Result();
                inital = Result.Zero;
                var res = BellTest.Run(qsim, 1000, inital).Result;
                Console.WriteLine("0: {0} 1: {1}",res.Item1,   res.Item2);

                Console.ReadKey();
            }
        }
    }
}