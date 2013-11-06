package aspects.designPatterns.subjectObserver.example;

/*
Copyright (c) Xerox Corporation 1998-2002.  All rights reserved.

Use and copying of this software and preparation of derivative works based
upon this software are permitted.  Any distribution of this software or
derivative works must comply with all applicable United States export control
laws.

This software is made available AS IS, and Xerox Corporation makes no warranty
about the software, its performance or its conformity to any specification.
*/

public class Demo {
    public static void main(String[] args) {

    	SecurityMonitor m1 = new SecurityMonitor();
    	Resource r1 = new Resource("R1");
    	Resource r2 = new Resource("R2");
    	Resource r3 = new Resource("R3");
    	
        r1.addObserver(m1);
        r2.addObserver(m1);
        r3.addObserver(m1);
        
        r1.setResource(new Object());
        r2.setResource(new Object());
        r3.setResource(new Object());
    }
}
