package aspects.timing;

/**
 * Aspect to get the estimated execution time of an operation.
 * The execution time does not include the method call, it only includes the execution of the method.
 * A possible overhead for weaving the aspect may exist.
 * 
 * @author Migueli
 * @date 05/11/2013
 * @version 1.0
 * 
 */
public abstract aspect ExecutionTime {

	private long startTime;
	
	abstract public pointcut operation();
	
	before(): operation() {
		startTime = System.nanoTime();
	}
	
	after(): operation() {
		long estimatedTime = System.nanoTime() - startTime;
		System.out.println("Execution time of '" + thisJoinPoint + "': " + estimatedTime + " ns.");
	}
}
