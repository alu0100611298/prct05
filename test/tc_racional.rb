# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def setup # Se inicializan 3 variables a,b,c con las que realizaremos las pruebas
		@a = Fraccion.new("2/20")
		@b = Fraccion.new(2 ,20 )  
		@c = Fraccion.new("1")
		@d = Fraccion.new("2")
	end
	
	def test_simple # Test simples sobre la suma resta multiplicacion y division se comprueba si el resultado es el correcto
		assert_equal("1/10", Fraccion.new("2/20").to_s) #Inicializando con un string
		assert_equal("1/10", Fraccion.new(2 ,20 ).to_s) #Inicializando con un string
		assert_equal("1/5", @a.suma(@b).to_s) # a + b
		assert_equal("0", @a.resta(@b).to_s) # a - b
		assert_equal("1/100", @a.producto(@b).to_s) # a * b
		assert_equal("1", @a.division(@b).to_s) # a / b
		assert_equal("1", Fraccion.new("1").to_s) #Inicializando con dos enteros
		assert_equal("2", Fraccion.new("2").to_s) #Inicializando con dos enteros
		assert_equal("3", @c.suma(@d).to_s) # c + d
		assert_equal("-1", @c.resta(@d).to_s) # c - d
		assert_equal("2", @c.producto(@d).to_s) # c * d
		assert_equal("1/2", @c.division(@d).to_s) # c / d
	end

	def test_typecheck #Test donde se comprueban diferentes tipos de variable en la inicializacion de la fraccion y se espera un error en el argumento.
		assert_raise( ArgumentError ) { Fraccion.new('a') } # Error de argumento con una cadena de caractares
		assert_raise( ArgumentError ) { Fraccion.new('a/b') } # Error de argumento con una cadena con el simbolo /
		assert_raise( ArgumentError ) { Fraccion.new('1/0') } # Error al dividir un número por 0
		assert_raise( ArgumentError ) { Fraccion.new('1aaa') } # Error de argumento con una cadena de caractares
		
	end

end
