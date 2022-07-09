package ejer4guia33;

import java.util.Calendar;

public class Extraccion extends Transaccion{
	//ATRIBUTOS
	private Monto myMonto;
	//CONSTRUCTOR
	public Extraccion(Calendar myFecha,Monto myMonto) {
		super(myFecha);
		this.myMonto=myMonto;
	}
	@Override
	public float montoTransaccion() {
		return myMonto.verMontoPeso();
	}
}
