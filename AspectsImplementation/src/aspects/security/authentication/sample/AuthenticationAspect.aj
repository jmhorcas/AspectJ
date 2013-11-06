package aspects.security.authentication.sample;

public aspect AuthenticationAspect {

	//Pointcut definition
	pointcut doSomething(): execution(void SampleWithoutAcn.doSomething());
	
	//Advice definition
    void around(): doSomething(){
    	int attempts = 3;
    	AuthenticationModule authenticator = new AuthenticationModule("Sample",attempts);
    	boolean success = authenticator.authenticate();
    	if (success)
    		proceed();
    }	
    		
}
