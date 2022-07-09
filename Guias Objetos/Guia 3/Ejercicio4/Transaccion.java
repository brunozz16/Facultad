package ejer4guia33;

import java.util.Calendar;

public abstract class Transaccion {
	private Calendar myFecha;
	public Transaccion(Calendar myFecha) {
		super();
		this.myFecha = myFecha;
	}
	public Calendar getFecha() {
		return myFecha;
	}
	public abstract float montoTransaccion();
	
	
}
