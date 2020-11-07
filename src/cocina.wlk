import comidas.*
import comensales.*

class Cocina {
	var property platos = []
	method carnivoros() = self.platos().filter({ comida=>comida.esAptoVegetariano() })
	method ofertaVegetariana() = (self.platos().size() - self.carnivoros().size()).abs() <= 2
	method platoFuerteCarnivoro() = self.carnivoros().max({ comida=>comida.valoracion() })
	method comidasQueLeAgradan(unComensal) = self.platos().filter({ comida=>unComensal.leAgrada(comida) })
	method elegirPlato(unComensal) { 
		const comida = self.comidasQueLeAgradan(unComensal).anyOne()
		if(not comida.equals(null) ) { platos.remove(comida) }
		else { self.error("No hay comida que le agrade en la cocina") }
		}
}
