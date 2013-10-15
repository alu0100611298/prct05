# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def setup # Se inicializan 3 variables a,b,c con las que realizaremos las pruebas
		@a = Fraccion.new("2/20")
		@b = Fraccion.new(2 ,20 )
	end
	
	def test_simple # Test simples sobre la suma resta multiplicacion y division se comprueba si el resultado es el correcto
		assert_equal("1/5", @a.suma(@b).to_s)
		assert_equal("0", @a.resta(@b).to_s)
		assert_equal("1/100", @a.producto(@b).to_s)
		assert_equal("1", @a.division(@b).to_s)
	end

	def test_typecheck #Test donde se comprueban diferentes tipos de variable en la inicializacion de la fraccion y se espera un error en el argumento.
		assert_raise( ArgumentError ) { Fraccion.new('a') }
		assert_raise( ArgumentError ) { Fraccion.new('a/b') }
		assert_raise( ArgumentError ) { Fraccion.new('1/0') }
	end

end