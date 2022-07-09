package ejer4guia33;

import java.util.Calendar;

public class Consulta extends Transaccion{

	public Consulta(Calendar myFecha) {
		super(myFecha);
	}

	@Override
	public float montoTransaccion() {
		return 0;
	}
	
}
