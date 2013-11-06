package aspects.security.authentication.sample;

import javax.security.auth.login.LoginContext;
import javax.security.auth.login.LoginException;

public class AuthenticationModule{

	private int attempts;
	private LoginContext lc;
	
	public AuthenticationModule(String loginContext, int attempts)
	{
		this.attempts = attempts;
		
        // Obtain a LoginContext, needed for authentication. Tell it
        // to use the LoginModule implementation specified by the
        // entry named "Sample" in the JAAS login configuration
        // file and to also use the specified CallbackHandler.
        lc = null;
        try {
            lc = new LoginContext(loginContext, new MyCallbackHandler());
        } catch (LoginException le) {
            System.err.println("Cannot create LoginContext. "
                + le.getMessage());
            System.exit(-1);
        } catch (SecurityException se) {
            System.err.println("Cannot create LoginContext. "
                + se.getMessage());
            System.exit(-1);
        }
    }
	
	boolean authenticate(){
		boolean success;
		
        // the user has X attempts to authenticate successfully
        int i;
        for (i = 0; i < attempts; i++) {
            try {

                // attempt authentication
                lc.login();

                // if we return with no exception, authentication succeeded
                break;

            } catch (LoginException le) {

                  System.err.println("Authentication failed:");
                  System.err.println("  " + le.getMessage());
                  try {
                      Thread.currentThread().sleep(3000);
                  } catch (Exception e) {
                      // ignore
                  }

            }
        }

        // did they fail three times?
        if (i == attempts) {
            System.out.println("Sorry");
            success = false;
        }else{
        	System.out.println("Authentication succeeded!");
        	success = true;
        }
        
        return success; 
	}	
}
