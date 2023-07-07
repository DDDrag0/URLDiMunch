package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {

	private List<Prodotto> prodotto;
	
	public Carrello() {
		prodotto = new ArrayList<>();
	}
	
	public void updateProduct(int quant, String idProdotto) {
		for(Prodotto prod : prodotto) {
			if(prod.getIdProdotto().equals(idProdotto)) {
				prod.setQuantitaCart(prod.getQuantitaCart()+quant);
				break;
			}
		}
	}
	
	public Prodotto searchProduct(String idProdotto) {
	    for (Prodotto prod : prodotto) {
	        if (prod.getIdProdotto().equals(idProdotto)) {
	            return prod;
	        }
	    }
	    return null;
	}
	
	public void addProduct(Prodotto product, int quant) {
		product.setQuantitaCart(quant);
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
	
	public boolean isEmpty() {
        return prodotto.isEmpty();
    }
	
	public List<Prodotto> getProducts() {
		return  prodotto;
	}
	
	public List<String> getProductIds() {
        List<String> productIds = new ArrayList<>();
        for (Prodotto prodotti : prodotto) {
            productIds.add(prodotti.getIdProdotto());
        }
        return productIds;
    }
	
	public List<String> getProductImages() {
        List<String> productImages = new ArrayList<>();
        for (Prodotto prodotti : prodotto) {
            productImages.add(prodotti.getImagepath());
        }
        return productImages;
    }
	
	public List<Integer> getProductQuantity() {
        List<Integer> productQuantity = new ArrayList<>();
        for (Prodotto prodotti : prodotto) {
            productQuantity.add(prodotti.getQuantitaCart());
        }
        return productQuantity;
    }
	
	public boolean prodExist(String name) {
        String namesearch;
        boolean check=false;
        for (Prodotto prodotti : prodotto) {
            namesearch= prodotti.getIdProdotto();
            if (namesearch.equals(name)) {
            	check=true;
            }
        }
        return check;
    }
}
