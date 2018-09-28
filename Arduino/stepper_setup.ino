void stepper_setup()
{
  
  pinMode(step_a_pin, OUTPUT);
  pinMode(step_b_pin, OUTPUT);
  pinMode(step_c_pin, OUTPUT);

  pinMode(dir_a_pin, OUTPUT);
  pinMode(dir_b_pin, OUTPUT);
  pinMode(dir_c_pin, OUTPUT);

  digitalWrite(dir_a_pin, LOW); // set initial motor direction
  digitalWrite(dir_b_pin, LOW); // set initial motor direction
  digitalWrite(dir_c_pin, LOW); // set initial motor direction

  //cli();//stop interrupts

  TCCR3A = 0;
  TCCR3B = 0;
  TCCR3A = _BV(COM3A0)  | _BV(WGM31) | _BV(WGM30); //control override for pin OC3A (IDE pin 5) Toggle OC3A on Compare Match, fast PWM with OCR3A as TOP
  TCCR3B = _BV(CS32)|_BV(CS30)| _BV(WGM33) | _BV(WGM32);  //internal clock with CLK/1 prescaling

  TCCR4A = 0;
  TCCR4B = 0;
  TCCR4A = _BV(COM4A0)  | _BV(WGM41) | _BV(WGM40); //control override for pin OC4A (IDE pin 6) Toggle OC4A on Compare Match, fast PWM with OCR4A as TOP
  TCCR4B = _BV(CS42) |_BV(CS40)| _BV(WGM43) | _BV(WGM42);  //internal clock with CLK/1 prescaling

  TCCR5A = 0;
  TCCR5B = 0;
  TCCR5A = _BV(COM5A0)  | _BV(WGM51) | _BV(WGM50); //control override for pin OC5A (IDE pin 46) Toggle OC5A on Compare Match, fast PWM with OCR5A as TOP
  TCCR5B = _BV(CS52) |_BV(CS50)| _BV(WGM53) | _BV(WGM52);  //internal clock with CLK/1 prescaling

  //sei(); // Start Interrupt

  OCR3A = 0;  //IDE pin 5 step_b_pin
  OCR4A = 0;  //IDE pin 6 step_a_pin
  OCR5A = 0;  //IDE pin 46 step_c_pin
  
}
