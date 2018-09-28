void stepper_run( uint8_t motorNumber, float motor_speed)
{ 
  bool dir;  //motor direction
  uint16_t PWM_count;

  //determine needed motor direction and make speed pos.
  if (motor_speed < 0)
  {
    dir = 1;
    motor_speed = abs(motor_speed);
  }
  else dir = 0;

  if (motor_speed > 10 )
  {
    PWM_count =15625/motor_speed;  //calculate needed compare value for speed
  }
  else PWM_count = 15625000000;  //set compare value to inf to keep stepper output from toggling when zero velocity needed

  if (motorNumber == 1) //motor a-------------------------------------------
  {
    digitalWrite(dir_a_pin, dir);
    dir_a = dir;
    OCR4A = PWM_count;  //set motor a step speed compare register
  }

  if (motorNumber == 2) //motor b----------------------------------------------
  {
    digitalWrite(dir_b_pin, dir);
    dir_b = dir;
    OCR3A = PWM_count; //set motor b step speed compare register
  }

  if (motorNumber == 3) //motor c-----------------------------------------------
  {
    digitalWrite(dir_c_pin, dir);
    dir_c = dir;
    OCR5A = PWM_count; //set motor c step speed compare register
  }
  
<<<<<<< HEAD
}
=======
}
>>>>>>> fde0ffbf156e966581cdd966662bb9d461e3685d
