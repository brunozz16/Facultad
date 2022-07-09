package ejer4guia33;

public class Moneda {
	//ATRIBUTOS
	private String descripcion;
	private Float cotizacion;
	private final Float dolar_a_peso=114.39f;
	private final Float real_a_peso=24.68f;
	//CONSTRUCTOR
	public Moneda(String descripcion, Float cotizacion) {
		super();
		this.descripcion = descripcion;
		this.cotizacion = cotizacion;
	}
	//METHODS
	public float convertirAPeso(float Monto) {
		float resultado=0f;
		resultado=Monto/cotizacion;
		/*if(descripcion=="dolar") resultado=cotizacion/dolar_a_peso;
		if(descripcion=="real") resultado=cotizacion/real_a_peso;*/
		
		return resultado;
	}
}
