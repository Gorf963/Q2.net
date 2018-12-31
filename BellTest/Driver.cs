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
                Result[] initals = new Result[] { Result.Zero, Result.One };
                foreach (Result inital in initals)
                {
                    var res = BellTest.Run(qsim, 1000, inital).Result;
                    Console.WriteLine("for inital of {2} ==> 0: {0} 1: {1} - Agree:{3}", res.Item1, res.Item2, inital, res.Item3);
                }
                Console.ReadKey();
            }
        }
    }
}