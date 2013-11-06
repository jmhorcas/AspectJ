package aspects.tracing;

/**
 * Trace aspect taken from AspectJ in Action 2009 Ramnivas Laddad.
 * 
 * @author Migueli
 * @date 05/11/2013
 * @version 1.0
 *
 */
public abstract aspect Trace {
	
    private int _callDepth = -1;
    
    abstract public pointcut tracePoints();

    before() : tracePoints() {
		_callDepth++;
		print("Before", thisJoinPoint);
    }

    after() : tracePoints() {
		print("After", thisJoinPoint);
		_callDepth--;
    }

    private void print(String prefix, Object message) {
		for(int i = 0, spaces = _callDepth * 2; i < spaces; i++) {
		    System.out.print(" ");
		}
		System.out.println(prefix + ": " + message);
    }
}

