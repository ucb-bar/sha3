package rocketchip

import Chisel._
import uncore._
import rocket._
import sha3._

import Implicits._

class Sha3Config extends ChiselConfig {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case "width" => 64
      case "stages" => Knob("stages")
      case "fast_mem" => Knob("fast_mem")
      case "buffer_sram" => Dump(Knob("buffer_sram"))
      case BuildRoCC => Some(() => (Module(new Sha3Accel, { case CoreName => "Sha3" })))
    }
  }
 
  override val topConstraints:List[ViewSym=>Ex[Boolean]] = List(
    ex => ex[Int]("width") === 64,
    ex => ex[Int]("stages") >= 1 && ex[Int]("stages") <= 4 && (ex[Int]("stages")%2 === 0 || ex[Int]("stages") === 1),
    ex => ex[Boolean]("fast_mem") === ex[Boolean]("fast_mem"),
    ex => ex[Boolean]("buffer_sram") === ex[Boolean]("buffer_sram")
    //ex => ex[Boolean]("multi_vt") === ex[Boolean]("multi_vt")
  )
  override val knobValues:Any=>Any = {
    case "stages" => 1
    case "fast_mem" => true
    case "buffer_sram" => false
    case "multi_vt" => true
  }
}

class Sha3VLSIConfig extends ChiselConfig(new Sha3Config ++ new DefaultVLSIConfig)
class Sha3FPGAConfig extends ChiselConfig(new Sha3Config ++ new DefaultFPGAConfig) 
class Sha3CPPConfig extends ChiselConfig(new Sha3Config ++ new DefaultCPPConfig) 
