num = 5

# class Persona
#   puts "Num es #{num}"
# end

# module ModuloX
#   puts "Num es #{num}"
# end

# def metodo_que_suma_num
#   num += 1
# end
#
# print "Num previo #{num}"
# metodo_que_suma_num
# print "Num posterior #{num}"

# num = 10
# l = lambda { num += 5 }
# puts "Num antes #{num}"
# l.call
# puts "Num despues #{num}"

# x = 1
# Module.new do
#   x += 1
# end
# puts "X es #{x}"

# Contador de instancias de distintas clases
# qty_instancias = 0
#
# Auto = Class.new do
#   define_method(:initialize) {
#     qty_instancias += 1
#   }
# end
#
# Moto = Class.new do
#   define_method(:initialize) do
#     qty_instancias += 1
#   end
# end
#
# Auto.new
# Moto.new
#
# puts "qty_instancias = #{qty_instancias}"

# class Persona
#   attr_reader :nombre
#
#   def initialize(nombre = "Agu")
#     @nombre = "Agu"
#   end
#
#   private
#   def password
#     "123456789"
#   end
# end
#
# agu = Persona.new
#
# agu.instance_eval do
#   puts password
# end
#
# renombrar_proc = proc {|nuevo_nombre| @nombre = nuevo_nombre}
# puts agu.nombre
# agu.instance_exec "Guido", &renombrar_proc
# puts agu.nombre

class Persona
  attr_reader :nombre
  def initialize(nombre = "Agu")
    @nombre = nombre
  end
  def method_missing(symbol, *args, &block)
    if symbol.to_s == "name"
      puts *args
      @nombre
    else
      super
    end
  end
  # def respond_to?(symbol)
  #   symbol.to_s == "name" || super
  # end
  def respond_to_missing?(symbol, *)
    symbol.to_s == "name" || super
  end
end

agu = Persona.new
# puts agu.name