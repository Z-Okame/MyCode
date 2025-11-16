
public class Spesa {
	
	private String data;
	private double importo;
	private String categoria;
	private String modalità_pagamento;
	
	//constructor 
	public Spesa (String data, double importo, String categoria, String modalità_pagamento) {
		this.data = data;
		this.importo = importo;
		this.categoria = categoria;
		this.modalità_pagamento = modalità_pagamento;
	}
		
	//setter
	public String getData() {
		return data;
	}
	public double getImporto() {
		return importo;
	}
	public String getCategoria() {
		return categoria;
	}
	public String getModalità_pagamento() {
		return modalità_pagamento;
	}
	
	//getter
	public void setData(String data) {
		this.data = data;
	}
	public void setImporto(double importo) {
		this.importo = importo;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public void setModalità_pagamento(String modalità_pagamento) {
		this.modalità_pagamento = modalità_pagamento;
	}
	
	//methods
	public void applicaIVA() {
		this.importo = this.importo + (this.importo * 0.22);
	}
	
	
	
}
