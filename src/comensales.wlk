import comidas.*

class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method satisfecho() = self.comidas().sum({ comida=>comida.peso() }) >= self.peso()*0.01
}

class Vegetariano inherits Comensal{
	override method leAgrada(unaComida) = unaComida.esAptoVegetariano() and unaComida.valoracion() > 85
	override method satisfecho() = super() and self.comidas().all({ x=>not x.esAbundante() })
}

class HambrePopular inherits Comensal{
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class PaladarFino inherits Comensal{
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	override method satisfecho() = super() and self.comidas().size().even()
}
