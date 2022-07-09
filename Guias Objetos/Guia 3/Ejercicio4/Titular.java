package ejer4guia33;

public class Titular {
	private String apellido;
	private String nombre;
	private String cuil;
	public Titular(String apellido, String nombre, String cuil) {
		this.apellido = apellido;
		this.nombre = nombre;
		this.cuil = cuil;
	}
	public String verNombreCompleto() {
		return nombre+" "+apellido;
	}
	
}
