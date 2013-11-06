/** Implementation of the aspect be use it with the Resource-SecurityMonitor example */
package aspects.designPatterns.subjectObserver.example;

import aspects.designPatterns.subjectObserver.Observer;
import aspects.designPatterns.subjectObserver.Subject;
import aspects.designPatterns.subjectObserver.SubjectObserverProtocol;

aspect SubjectObserverProtocolImpl extends SubjectObserverProtocol {

	/** Dynamic crosscutting */
    public pointcut stateChanges(Subject s):
                    target(s) &&
                    call(void Resource.setResource(..));
	
	/** Static crosscutting */
    declare parents: Resource implements Subject;
    public Object Resource.getData() { return this; }
    public String Resource.getId() {return this.name;}

    declare parents: SecurityMonitor implements Observer;
    public void    SecurityMonitor.update(String id) {
    	showMonitoredData(getSubject(id) + " is being modified\n");
    }

    
}
