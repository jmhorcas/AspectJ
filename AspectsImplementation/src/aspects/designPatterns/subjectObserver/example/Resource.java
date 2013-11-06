package aspects.designPatterns.subjectObserver.example;

public class Resource {

	protected String name;
	protected Object data;
	
    Resource(String name) {
    	this.name = name;
    }
    
    public void setResource(Object data)
    { this.data = data; }
    
    public Object getResource()
    { return data; }

    public String toString()
    { return "Resource ["+name + " data = " 
              + data+"]"; }
}
