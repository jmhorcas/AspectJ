package tests.factorial;

import aspects.tracing.Trace;

public aspect FactorialTrace extends Trace {

	public pointcut tracePoints(): execution(* Factorial.factorialRec(..));
}
