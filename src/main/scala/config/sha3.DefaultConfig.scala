package sha3
import config._

class Config0 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => false
    case "stages" => 4
    case "buffer_sram" => false
  }
)

class DefaultConfig0 extends Config(new Config0 ++ new DefaultConfig)

class Config1 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => false
    case "stages" => 2
    case "buffer_sram" => false
  }
)

class DefaultConfig1 extends Config(new Config0 ++ new DefaultConfig)

class Config2 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => false
    case "stages" => 2
    case "buffer_sram" => true
  }
)

class DefaultConfig2 extends Config(new Config0 ++ new DefaultConfig)

class Config3 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => false
    case "stages" => 4
    case "buffer_sram" => true
  }
)

class DefaultConfig3 extends Config(new Config0 ++ new DefaultConfig)

class Config4 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => true
    case "stages" => 2
    case "buffer_sram" => true
  }
)

class DefaultConfig4 extends Config(new Config0 ++ new DefaultConfig)

class Config5 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => true
    case "stages" => 4
    case "buffer_sram" => true
  }
)

class DefaultConfig5 extends Config(new Config0 ++ new DefaultConfig)

class Config6 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => true
    case "stages" => 2
    case "buffer_sram" => false
  }
)

class DefaultConfig6 extends Config(new Config0 ++ new DefaultConfig)

class Config7 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => true
    case "stages" => 4
    case "buffer_sram" => false
  }
)

class DefaultConfig7 extends Config(new Config0 ++ new DefaultConfig)

class Config8 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => true
    case "stages" => 1
    case "buffer_sram" => false
  }
)

class DefaultConfig8 extends Config(new Config0 ++ new DefaultConfig)

class Config9 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => true
    case "stages" => 1
    case "buffer_sram" => true
  }
)

class DefaultConfig9 extends Config(new Config0 ++ new DefaultConfig)

class Config10 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => false
    case "stages" => 1
    case "buffer_sram" => false
  }
)

class DefaultConfig10 extends Config(new Config0 ++ new DefaultConfig)

class Config11 extends Config (
  (pname, site, here) => pname match {
    case "fast_mem" => false
    case "stages" => 1
    case "buffer_sram" => true
  }
)

class DefaultConfig11 extends Config(new Config0 ++ new DefaultConfig)
