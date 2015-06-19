public class Toaster implements KitchenUtility {
	
	private String modelNumber;
	private Integer numberInStock;
	public Toaster ()
	{
		modelNumber='XX=XX';
		numberInStock=0;
	}
	
	public String getModelNumber() {
		return 'T' + modelNumber;
	}

}