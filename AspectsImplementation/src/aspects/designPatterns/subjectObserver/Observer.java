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

/** Modified to support observing 
 * multiple subjects 
 * */
public interface Observer {
	public void setSubject(Subject s);
	public Subject getSubject(String id);
	public void removeSubject(String id);
	public Vector<Subject> getSubjects();
	public void update(String id);
}
