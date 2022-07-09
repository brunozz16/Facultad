package ejer4guia33;

public class Monto {
	private float myMonto;
	private Moneda myMoneda;
	public Monto(float myMonto, Moneda myMoneda) {
		super();
		this.myMonto = myMonto;
		this.myMoneda = myMoneda;
	}
	public float verMontoPeso() {
		return myMoneda.convertirAPeso(myMonto);
	}
}
