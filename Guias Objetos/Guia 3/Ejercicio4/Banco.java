package ejer4guia33;

import java.util.Calendar;
import java.util.Vector;

public class Banco {
	//ATRIBUTOS
	private Vector<Cuenta> myCuentas;
	private String myNombre;
	//CONSTRUCTOR
	public Banco(Vector<Cuenta> myCuentas, String myNombre) {
		this.myCuentas = myCuentas;
		this.myNombre = myNombre;
	}
	public void listarCuentas(Calendar desde,Calendar hasta) {
		
		for(Cuenta oC:myCuentas) {
			System.out.println(oC.getTitular()+" - nro cta:"+oC.getNroCuenta()+
					" - comision:"+oC.calcularComision(desde,hasta));
		}
		
	}
}
