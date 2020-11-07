class Comida {
	method peso()
	method valoracion()
	method esAptoVegetariano() = false
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Comida{
	var property peso
	var property especias = false
	override method esAptoVegetariano() = not self.especias()
	method esEspecial() = self.esAbundante() or self.especias()
	override method valoracion() = if (self.esEspecial()) { 120 } else { 80 }
}

class Hamburguesas inherits Comida{
	var property pan
	override method peso() = 250
	override method valoracion() = 60 + pan.puntos()
}

class HamburguesasVegetarianas inherits Hamburguesas{
	var property legumbre = ""
	override method esAptoVegetariano() = true
	override method valoracion() = (super() + 2 * legumbre.size()).min(17)
}

object industrial { method puntos() = 0 }
object casero { method puntos() = 20 }
object masaMadre { method puntos() = 45 }


class Corte {
	var property nombre
	var property calidad = 0
	var property peso = 0
}

class Parrillada inherits Comida {
	var property cortesPedidos = []
	override method peso() = self.cortesPedidos().sum({ x => x.peso() })
	method cantidadCortes() = cortesPedidos.size()
	method maximaCalidadCortes() = cortesPedidos.max({ x => x.calidad() })
	override method valoracion() = 15 * self.maximaCalidadCortes() - self.cantidadCortes()
}
