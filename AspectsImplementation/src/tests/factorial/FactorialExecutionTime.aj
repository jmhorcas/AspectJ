package tests.factorial;

import aspects.timing.ExecutionTime;

public aspect FactorialExecutionTime extends ExecutionTime {

	public pointcut operation(): execution(* Factorial.factorial(..));
}
