package sha3

class DefaultConfig0 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => false
    case "stages" => 4
    case "buffer_sram" => false
  }
}

class DefaultConfig1 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => false
    case "stages" => 2
    case "buffer_sram" => false
  }
}

class DefaultConfig2 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => false
    case "stages" => 2
    case "buffer_sram" => true
  }
}

class DefaultConfig3 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => false
    case "stages" => 4
    case "buffer_sram" => true
  }
}

class DefaultConfig4 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => true
    case "stages" => 2
    case "buffer_sram" => true
  }
}

class DefaultConfig5 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => true
    case "stages" => 4
    case "buffer_sram" => true
  }
}

class DefaultConfig6 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => true
    case "stages" => 2
    case "buffer_sram" => false
  }
}

class DefaultConfig7 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => true
    case "stages" => 4
    case "buffer_sram" => false
  }
}

class DefaultConfig8 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => true
    case "stages" => 1
    case "buffer_sram" => false
  }
}

class DefaultConfig9 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => true
    case "stages" => 1
    case "buffer_sram" => true
  }
}

class DefaultConfig10 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => false
    case "stages" => 1
    case "buffer_sram" => false
  }
}

class DefaultConfig11 extends DefaultConfig {
  override val knobValues:Any=>Any = {
    case "fast_mem" => false
    case "stages" => 1
    case "buffer_sram" => true
  }
}
