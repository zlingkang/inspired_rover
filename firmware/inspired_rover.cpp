#include <Arduino.h>
#include <PID_v1.h>
#include <Thread.h>
#include <ThreadController.h>

ThreadController rover_control = ThreadController();

class MotorThread: public Thread{
    public:
        const byte PIN_IN1_;
        const byte PIN_IN2_;
        const byte PIN_PWM_;
        const byte PIN_OUT_;
        const byte EXT_INT_; // external interupt
        static const double WHEEL_DIS_ = 6.5 * 3.14;
        static const double ENC_NUM_ = 12800;
        double ENC2DIS_;
        double set_speed_;
        double input_speed_;
        double output_pwm_;
        double kp_;
        double ki_;
        double kd_;
        unsigned long encoder_cnt_;
        PID *motor_pid_;
        
        MotorThread(byte pin_in1, byte pin_in2, byte pin_pwm, byte pin_out, byte ext_int) :
            PIN_IN1_(pin_in1),
            PIN_IN2_(pin_in2),
            PIN_PWM_(pin_pwm),
            PIN_OUT_(pin_out),
            EXT_INT_(ext_int),
            Thread(){
                pinMode(PIN_OUT_, INPUT_PULLUP);
                //attachInterrupt(EXT_INT_, encoderUpdate, FALLING);

                ENC2DIS_ = WHEEL_DIS_ / ENC_NUM_;
                kp_ = 7.4;
                ki_ = 0; 
                kd_ = 0;
                set_speed_ = 0;
                output_pwm_ = 0;
                motor_pid_ = new PID(&input_speed_, &output_pwm_, &set_speed_, kp_, ki_, kd_, DIRECT);
                motor_pid_ -> SetOutputLimits(0, 255);
                motor_pid_ -> SetMode(AUTOMATIC);
                
                encoder_cnt_ = 0;

                digitalWrite(PIN_IN1_, LOW);
                digitalWrite(PIN_IN2_, LOW);

                setInterval(100);
        }
        
        void encoderUpdate(){
            encoder_cnt_ ++;
        }

        void setSpeed(double set_speed){
            set_speed_ = set_speed;
        }

        void setPWM(double set_pwm){
            if(set_pwm >= 0){
                digitalWrite(PIN_IN1_, HIGH);
                digitalWrite(PIN_IN2_, LOW);
                output_pwm_ = set_pwm;
            }
            else{
                digitalWrite(PIN_IN1_, LOW);
                digitalWrite(PIN_IN2_, HIGH);
                output_pwm_ = -set_pwm;
            }
            analogWrite(PIN_PWM_, output_pwm_);
        }

        void run(){
            input_speed_ = (double)encoder_cnt_ * ENC2DIS_ * 1000 / interval;  
            encoder_cnt_ = 0;
/*        
            if(set_speed_ >= 0){
                digitalWrite(PIN_IN1_, HIGH);
                digitalWrite(PIN_IN2_, LOW);
            }
            else{
                digitalWrite(PIN_IN1_, LOW);
                digitalWrite(PIN_IN2_, HIGH);
                set_speed_ = -set_speed_;
            }
            
            motor_pid_->Compute();
            analogWrite(PIN_PWM_, output_pwm_);
*/            
            runned();
        }
};
   
MotorThread left_motor(4, 5, 9, 3, 0), right_motor(14, 16, 10, 2, 1);

void leftmotorEncoderUpdate(){
    left_motor.encoderUpdate();
}

void rightmotorEncoderUpdate(){
    right_motor.encoderUpdate();
}

void serialListen(){
    if(Serial.available() > 5){
        byte startbyte = Serial.parseInt();
        if(startbyte == 255){
            int l_dir = Serial.parseInt();
            int l_speed = Serial.parseInt();
            int r_dir = Serial.parseInt();
            int r_speed = Serial.parseInt();
            if(l_dir){
                left_motor.setPWM(l_speed);
            }
            else{
                left_motor.setPWM(-l_speed);
            }
            if(r_dir){
                right_motor.setPWM(r_speed);
            }
            else{
                right_motor.setPWM(-r_speed);
            }
        }   
    }
}

void serialPrint(){
    Serial.print(left_motor.output_pwm_);
    Serial.print(" ");
    Serial.println(right_motor.output_pwm_);
}

void setup(){
    Serial.begin(9600);
    
    attachInterrupt(0, leftmotorEncoderUpdate, FALLING); //D3
    attachInterrupt(1, rightmotorEncoderUpdate, FALLING); //D2
}

void loop(){
    rover_control.run();
    serialListen();
    //serialPrint();
}
