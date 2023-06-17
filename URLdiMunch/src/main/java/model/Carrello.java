package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {

	private List<Prodotto> prodotto;
	
	public Carrello() {
		prodotto = new ArrayList<Prodotto>();
	}
	
	public void addProduct(Prodotto product) {
		prodotto.add(product);
	}
	
	public void deleteProduct(Prodotto product) {
		for(Prodotto prod : prodotto) {
			if(prod.getIdProdotto().equals(product.getIdProdotto())) {
				prodotto.remove(prod);
				break;
			}
		}
 	}
	
	public List<Prodotto> getProducts() {
		return  prodotto;
	}
}
