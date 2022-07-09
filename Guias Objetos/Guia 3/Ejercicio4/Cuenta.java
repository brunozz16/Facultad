package ejer4guia33;

import java.util.Calendar;
import java.util.Vector;

public class Cuenta {
	//ATRIBUTOS
	private Titular myTitular;
	private String myNroCuenta;
	private Vector<Transaccion> myTransacciones;
	//CONSTRUCTOR
	public Cuenta(Titular myTitular, String myNroCuenta, Vector<Transaccion> myTransacciones) {
		this.myTitular = myTitular;
		this.myNroCuenta = myNroCuenta;
		this.myTransacciones = myTransacciones;
	}
	//GETTERS AND SETTERS
	public String getNroCuenta() {
		return this.myNroCuenta;
	}
	public String getTitular() {
		return myTitular.verNombreCompleto();
	}
	//METHODS
	public float calcularComision(Calendar desde,Calendar hasta) {
		float comision=0f;
		float a=cantidadTransacciones(desde,hasta);
		float b=sumatoriaTransaccionesPesos(desde,hasta);
		comision=30-((a/b)*0.005f);
		return comision;
	}
	public int cantidadTransacciones(Calendar desde,Calendar hasta) {
		int contador=0;
		for(Transaccion oT:myTransacciones) {
			if(oT.getFecha().before(hasta) && oT.getFecha().after(desde))
			contador+=1;
		}
		return contador;
	}
	public float sumatoriaTransaccionesPesos(Calendar desde,Calendar hasta) {
		float suma=0f;
		for(Transaccion oT:myTransacciones) {
			if(oT.getFecha().before(hasta) && oT.getFecha().after(desde))
			suma+=oT.montoTransaccion();
		}
		return suma;
	}
	
}
