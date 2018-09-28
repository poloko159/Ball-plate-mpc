
//----------------------------------------------------------------------
//Control stuff for stepper motors
//----------------------------------------------------------------------

#define dir_a_pin 8
#define dir_b_pin 14
#define dir_c_pin 48

const byte interruptPin_a = 2;
const byte interruptPin_b = 3;
const byte interruptPin_c = 21;

#define step_a_pin 6
#define step_b_pin 5
#define step_c_pin 46

volatile int countPulse_a = 0;
volatile int countPulse_b = 0;
volatile int countPulse_c = 0;

String inData1,inData2,inData3;  // Buffer for getting data
double set_angle_a, set_angle_b, set_angle_c;  
double measured_angle_a = 0, measured_angle_b = 0, measured_angle_c = 0;  
int dir_a,dir_b,dir_c;

void setup() {
    Serial.begin(115200);
    Serial.setTimeout(5);
    
    stepper_setup();
    
    pinMode(interruptPin_a, INPUT_PULLUP);
    pinMode(interruptPin_b, INPUT_PULLUP);
    pinMode(interruptPin_c, INPUT_PULLUP);
        
    attachInterrupt(0, countPulse_motor_a, RISING );
    attachInterrupt(1, countPulse_motor_b, RISING );
    attachInterrupt(2, countPulse_motor_c, RISING );
    
    set_angle_a = 30;
    set_angle_b = 29;
    set_angle_c = 29;
    stepper_run(1,(set_angle_a-countPulse_a*1.8/16)*80);
    stepper_run(2,(set_angle_c-countPulse_b*1.8/16)*80);
    stepper_run(3,(set_angle_b-countPulse_c*1.8/18)*80);
    
    delay(1600);
}
void loop() 
{
    if(Serial.available())
    {
      inData1 = Serial.readStringUntil('a');
      inData2 = Serial.readStringUntil('b');
      inData3 = Serial.readStringUntil('c');

      set_angle_a = inData1.toInt() + 30;
      set_angle_b = inData2.toInt() + 29;
      set_angle_c = inData3.toInt() + 29;

    }
    stepper_run(1,(set_angle_a-countPulse_a*1.8/16)*80);
    stepper_run(2,(set_angle_c-countPulse_b*1.8/16)*80);
    stepper_run(3,(set_angle_b-countPulse_c*1.8/16)*80);
    delay(1);
}

<<<<<<< HEAD

=======

>>>>>>> fde0ffbf156e966581cdd966662bb9d461e3685d
