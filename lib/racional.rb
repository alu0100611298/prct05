# Implementar en este fichero la clase para crear objetos racionales

require "gcd.rb"

class Fraccion

	attr_accessor :numerador, :denominador #Se definen los getter y los setter para las variables numerador y denominador de la clase Fraccion

	def initialize(*a) #Se pasan uno o mas argumentos
		if a[0].class == String #Si lo que se le pasa es una cadena del tipo a/b donde a y b son enteros se guarda la a en numerador y la b en denominador
			raise ArgumentError, "La cadena introducida no concuerda con a/b o a siendo a y b enteros." unless /\d+(\/\d+)?/.match(a[0]) #Se comprueba que la cadena que se le pasa es del tipo a/b o a
			if /\d+\/\d+/.match(a[0])
				numerador = ((/\d+/.match(a[0])).to_s).to_i # recojo el número antes de la /
				denominador = ((/\d+/.match((/\/\d+/.match(a[0])).to_s)).to_s).to_i #recojo /b y luego solo el número b.
				if denominador == 0 # En el caso de q b sea 0.
					raise ArgumentError , "No se puede dividir por 0"
				end
			else
				numerador = ((/\d+/.match(a[0])).to_s).to_i # recojo el número antes de la /
				denominador = 1
			end
		else #Si no era una cadena y se le pasan dos argumentos de tipo entero
			raise ArgumentError unless a[0].is_a?(Numeric) #compruebo si el primer argumento es un mumero.	
			numerador = a[0]
			denominador = a[1]
		end
		raise ArgumentError unless numerador.is_a?(Numeric) #Compruebo si a es un numero
		raise ArgumentError unless denominador.is_a?(Numeric) #Compruebo si b es un numero
		mcd = gcd(numerador,denominador) #Se llama a la funcion que calcula el máximo comun divisor
		# Se dividen los dos números por su mcd reduciendo la fraccion a su mínima expresión.
		@numerador = numerador/mcd
		@denominador = denominador/mcd
	end

	def to_s  # devuelve una cadena con la representación del racional
		if @numerador == 0 # Si el numerador es 0 imprime solo cualquier numero divido por 0 da 0
			"0"
		elsif @numerador == @denominador #Si numerador y denominador son igual el resultado es 1
			"1"
		else #se imprime el numerador el separador de la fracción y el denominador.
			"#{@numerador}/#{@denominador}"
		end
	end

	def suma(otro)  # devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parámetro
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
# Trabajo con la clase:
a = Fraccion.new(2, 20) # Se construye una feacción
b = Fraccion.new(2, 20)
c = Fraccion.new("1/0") # Otra manera de hacerlo
puts a; #Se imprime
puts b;
puts a.suma(b) # Se suma a + b
puts a.resta(b) # Se resta a - b
puts a.producto(b) # Se multiplica a * b
puts a.division(b) # Se divide a : b
puts "Producto /0"
puts c.producto(b)
b = Fraccion.new("2/20")
puts b
b = Fraccion.new("1")
puts b
end
