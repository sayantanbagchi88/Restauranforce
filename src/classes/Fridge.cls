public class Fridge implements KitchenUtility {
	private String modelNumber;
	private Integer numberInStock;
	public static Integer stockThreshold = 5;
	public void updateStock(Integer justSold) {
		numberInStock = numberInStock - justSold;
	}
	public void setModelNumber(String theModelNumber) {
		modelNumber = theModelNumber;
	}
    public void setNumberInStock(Integer n)
    {
        numberInStock=n;
    }
	public String getModelNumber() {
		return 'F'+ modelNumber;
	}   
     public Integer getNumberInStock()
    {
        return numberInStock;
    }
    public fridge ()
    {
        modelNumber = 'XX-XX';
        numberInStock=0;
    }
    public Fridge(String theModelNumber, Integer theNumberInStock) {
        modelNumber = theModelNumber;
		numberInStock = theNumberInStock;
	}
	
	public static void toDebug(Fridge aFridge) {
		System.debug ('ModelNumber = ' + aFridge.modelNumber);
		System.debug ('Number in Stock = ' + aFridge.numberInStock);
	}
	
	public Integer ecoRating {
		get { 
			return ecoRating;
		}
		set { 
			ecoRating = value;
			if (ecoRating < 0) 
			 	ecoRating =0;
		}
	}
   
}