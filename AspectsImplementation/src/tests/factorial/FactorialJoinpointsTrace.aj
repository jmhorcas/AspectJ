package tests.factorial;

import aspects.tracing.Trace;

public aspect FactorialJoinpointsTrace extends Trace {

	public pointcut tracePoints(): within(tests.factorial.Factorial);
}
