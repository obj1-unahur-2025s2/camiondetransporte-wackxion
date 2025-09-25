object camion {

const cosas = []
method cosas() = cosas
method cargarCosa(cosa) = cosas.add(cosa)
method descargarCosa(cosa) = cosas.remove(cosa)
method tara() = 1000
method pesoTotal(){
    self.cosas().map({c => c.peso()}).sum() +
    self.tara()
}
method pesoDeTodasLasCosasEnELCamionSonPar(){
    self.cosas().all({c => c.peso().even()})
}


}