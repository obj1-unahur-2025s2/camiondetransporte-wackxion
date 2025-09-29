// part 1
object knightRider {
    method peso() = 500
    method nivelDePeligro() = 10
}
object bumblebe {
    var estaEnModoAuto = true
    var nivelDePeligro = 15
    method peso() = 800 
    method nivelDePeligro() = nivelDePeligro 
    method estaEnModoAuto() = estaEnModoAuto
    method transformar(){
        if(self.estaEnModoAuto()){
            estaEnModoAuto = false
            nivelDePeligro = 30
        } else {
            estaEnModoAuto = true
            nivelDePeligro = 15
        }
    } 
}
object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0

    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligro() = 2
    method cargarLadrillos(cantidad) {
      cantidadDeLadrillos = cantidad
    }
}

object arena {
    var pesoCargado = 0
    method peso() = pesoCargado
    method nivelDePeligro() = 1
    method cargarArena(cantidad) {
      pesoCargado = cantidad
    }
}
object bateriaAntiaerea {
  var peso = 200
  var nivelDePeligro = 0
  var misilesEstanCargados = false
  method misilesEstanCargados() = misilesEstanCargados
  method peso() = peso
  method nivelDePeligro() = nivelDePeligro
  method cargarMisilesODescargarMisiles(){
    if(not self.misilesEstanCargados()){
        peso = 300
        nivelDePeligro = 100
        misilesEstanCargados = true
    } else{
        peso = 200
        nivelDePeligro = 0
        misilesEstanCargados = false
    }
  }
}
object contenedorPortuario {
    const cosasDentroDelContenedor = []
    
    method cargarCosaAlContenedor(cosa) {
        cosasDentroDelContenedor.add(cosa)
    }
    method descargarCosaDelContenedor(cosa) {
        cosasDentroDelContenedor.remove(cosa)
    }
    method pesoTotalContenido() {
        return self.cosasDentroDelContenedor().map({c => c.peso()}).sum()
    }
    method nivelesDePeligroContenidos(){
        return self.cosasDentroDelContenedor().map({c => c.nivelDePeligro()}).asSet()
    }
    method mayorNivelDePeligrocidadContenido(){
        if(not self.nivelesDePeligroContenidos().isEmpty()){
            return self.nivelesDePeligroContenidos().max()
        }else{
            return 0}
    }
    method cosasDentroDelContenedor() = cosasDentroDelContenedor
    method peso() = 100 + self.pesoTotalContenido()
    method nivelDePeligro() = self.mayorNivelDePeligrocidadContenido()
}

object residuosRadiactivos {
    var peso = 0
    method cargarReciduos(cantidad) {
      peso = cantidad
    }
    method peso() = peso
    method nivelDePeligro() = 200
}
object embalajeDeSeguridad {
    var cosaAEnvolver = null
    method cambiarCosasAEnvolver(cosa){
        cosaAEnvolver = cosa
    }
    method peso() = cosaAEnvolver.peso()
    method nivelDePeligro() = cosaAEnvolver.nivelDePeligro().div(2)
}