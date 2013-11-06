/*
Copyright (c) Xerox Corporation 1998-2002.  All rights reserved.

Use and copying of this software and preparation of derivative works based
upon this software are permitted.  Any distribution of this software or
derivative works must comply with all applicable United States export control
laws.

This software is made available AS IS, and Xerox Corporation makes no warranty
about the software, its performance or its conformity to any specification.
*/

package aspects.designPatterns.subjectObserver;

import java.util.Hashtable;
import java.util.Vector;

/** Modified to support multiple subjects - multiple observers interaction */
public abstract aspect SubjectObserverProtocol {

	/** Dynamic crosscutting*/
    public abstract pointcut stateChanges(Subject s);

    after(Subject s): stateChanges(s) {
        for (int i = 0; i < s.getObservers().size(); i++) {
            ((Observer)s.getObservers().elementAt(i)).update(s.getId());
        }
    }

    /** Static crosscutting */
    /** Fields, structure and behaviour to be added to the Subject **/
    private Vector<Observer> Subject.observers = new Vector<>();
    private String Subject.id;
    public void   Subject.addObserver(Observer obs) {
        observers.addElement(obs);
        obs.setSubject(this);
    }
    public void   Subject.removeObserver(Observer obs) {
        observers.removeElement(obs);
        obs.removeSubject(getId());
    }
    public Vector<Observer> Subject.getObservers() { return observers; }
    
    /** Fields, structure and behaviour to be added to the Observer **/
    private Hashtable<String,Subject> Observer.subjects = new Hashtable<>();
    public void     Observer.setSubject(Subject s) { subjects.put(s.getId(),s); }
    public void 	Observer.removeSubject(String id) {subjects.remove(id);}
    public Subject  Observer.getSubject(String id) { return subjects.get(id); }
    public Vector<Subject>   Observer.getSubjects(){return new Vector<Subject>(subjects.values()); }
}
