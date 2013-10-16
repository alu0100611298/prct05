
require "racional.rb"

def main
	puts "Bienvenido al programa de suma, resta, multiplicación y división de fracciones"
	puts "Se pediran dos fracciones al usuario y se le realizarán las distintas operaciones"
	puts "Introduzca una fraccion del tipo \"a/b\" donde a y b son números enteros."
	fraccion_a =  gets
	a = Fraccion.new(fraccion_a)
	puts "Introduzca la segunda fraccion del tipo \"a/b\" donde a y b son números enteros."
	fraccion_b =  gets
	b = Fraccion.new(fraccion_b)
	puts "Fracción a:"
	puts a;
	puts "Fracción b:"
	puts b;
	puts "Suma a + b:"
	puts a.suma(b)
	puts "Resta a - b:"
	puts a.resta(b)
	puts "Producto a * b"
	puts a.producto(b)
	puts "División a / b"
	puts a.division(b)
end

main
