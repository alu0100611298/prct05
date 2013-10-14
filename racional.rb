# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion

	attr_accessor :numerador, :denominador

	def initialize(a,b)
		raise unless a.is_a?(Numeric)
		raise unless b.is_a?(Numeric)
		#@numerador = ((/\d+/.match(fraccion)).to_s).to_i # recojo el número antes de la /
		#@denominador = ((/\d+/.match((/\/\d+/.match(fraccion)).to_s)).to_s).to_i #recojo la y el número y luego solo el número
		mcd = gcd(a,b)
		@numerador = a/mcd
		@denominador = b/mcd
	end

	def to_s  # devuelve una cadena con la representación del racional
		if @numerador == 0
			"0"
		elsif @numerador == @denominador
			"1"
		else
			"#{@numerador}/#{@denominador}"
		end
	end

	def suma(otro)  # devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parámetro
		#a = (@numerador*otro.denominador + otro.numerador*@denominador).to_s
		#b = (@denominador*otro.denominador).to_s
		#c = a << '/' << b
		# Fraccion.new(c)
		Fraccion.new(@numerador*otro.denominador + otro.numerador*@denominador, @denominador*otro.denominador)
	end

	def resta(otro) # devuelve un nuevo racional que resta al objeto que invoca el que le pasan como parámetro 
		Fraccion.new(@numerador*otro.denominador - otro.numerador*@denominador, @denominador*otro.denominador)
	end

	def producto(otro)  # devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
		Fraccion.new(@numerador*otro.numerador, @denominador*otro.denominador)
	end

	def division(otro)  # devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
		Fraccion.new(@numerador*otro.denominador, @denominador*otro.numerador)
	end
end
if __FILE__ == $0
#a = Fraccion.new("1/2")
#b = Fraccion.new("1/2")
a = Fraccion.new(2, 20)
b = Fraccion.new(2, 20)
puts a;
puts b;
puts a.suma(b)
puts a.resta(b)
puts a.producto(b)
puts a.division(b)
end
