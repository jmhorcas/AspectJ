package tests.factorial;

import java.util.HashMap;
import java.util.Map;

import aspects.caching.OptimizeRecursionCache;


public aspect FactorialOptimizeRecursionCache extends OptimizeRecursionCache {

	public pointcut operation(Object o): call(long *.factorialRec(int)) && args(o);

	@Override
	public Map getCache() {
		return new HashMap<Integer, Long>();
	}
}
