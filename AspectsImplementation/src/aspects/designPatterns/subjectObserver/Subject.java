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

import java.util.Vector;

/** Modified to be able to identify the Subject **/
public interface Subject {
    public void addObserver(Observer obs);
    public void removeObserver(Observer obs);
    public Vector<Observer> getObservers();
    public Object getData();
    public String getId();
}
