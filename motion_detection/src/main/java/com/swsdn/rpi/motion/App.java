package com.swsdn.rpi.motion;

import static com.pi4j.io.gpio.PinPullResistance.PULL_DOWN;
import static com.pi4j.io.gpio.RaspiPin.GPIO_01;
import static java.lang.String.format;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalInput;
import com.pi4j.io.gpio.event.GpioPinDigitalStateChangeEvent;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws InterruptedException
    {
    	System.out.println("App started.");
        GpioController gpio = GpioFactory.getInstance();
        GpioPinDigitalInput sensor = gpio.provisionDigitalInputPin(GPIO_01, PULL_DOWN);
        
        sensor.addListener(new GpioPinListenerDigital() {
			
			public void handleGpioPinDigitalStateChangeEvent(GpioPinDigitalStateChangeEvent event) {
				System.out.println(format("sensor value id %s", event.getState().getValue()));
			}
		});

        for (;;) {
        	Thread.sleep(5000);
        	System.out.print('.');
        }
    }
}
