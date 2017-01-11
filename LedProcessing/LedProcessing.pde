/*** Deniz Karakay
     09.01.2017 ***/

import processing.serial.*;
import controlP5.*;
Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port
ControlP5 cp5;
final String ICON  = "icon.png";//the image I want to use as icon
void setup() 
{
 // ImageIcon titlebaricon = new ImageIcon(loadBytes("icon.png"));
//  frame.setIconImage(titlebaricon.getImage());
  size(850, 450);
  noStroke();
  cp5 = new ControlP5(this);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  PImage[] imgs = {loadImage("dice_orange.png"),loadImage("dice_yellow.png"),loadImage("dice_purple.png")};
  PImage[] imgsRGB = {loadImage("rgb.png"),loadImage("rgb_white.png"),loadImage("rgb.png")};
  PImage[] imgsDisco = {loadImage("dancing_t.png"),loadImage("dancing_blue.png"),loadImage("dancing_green.png")};
  PImage[] imgsClose = {loadImage("close_grey.png"),loadImage("close_red.png"),loadImage("close_grey.png")};
   cp5.addButton("Blue")
     .setValue(0)
     .setColorValue(0xffff88ff)
     .setPosition(450,50)
     .setSize(150,150)
     ;
   cp5.addButton("White")
     .setValue(0)
     .setColorForeground(color(204,204,204))
     .setColorBackground(color(115,115,115))
     .setColorActive(color(115,115,115))
     .setPosition(650,50)
     .setSize(150,150)
     ;
   cp5.addButton("Green")
     .setPosition(250,50)
     .setSize(150,150)
     .setValue(0)
     .setColorForeground(color(25,211,15))
     .setColorBackground(color(16,134,10))
     .setColorActive(color(16,134,10))
     ;
   cp5.addButton("Red")
     .setPosition(50,50)
     .setSize(150,150)
     .setValue(0)
     .setColorForeground(0xffaa0000)
     .setColorBackground(0xff660000)
     .setColorActive(0xff660000)
     ;
   cp5.addButton("Random")
     .setImages(imgs)
     .setValue(0)
     .setPosition(75,275)
     .setSize(150,150)
     ;
   cp5.addButton("Mix")
     .setImages(imgsRGB)
     .setPosition(275,275)
     .setSize(150,150)
     .setValue(0)
     ;
   cp5.addButton("Disco")
     .setImages(imgsDisco)
     .setPosition(475,275)
     .setSize(150,150)
     .setValue(0)    
     ;
   cp5.addButton("Close")
     .setImages(imgsClose)
     .setPosition(675,275)
     .setSize(150,150)
     .setValue(0)    
     ;
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,241);
  
   cp5.getController("Red")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(35)
     ;
     cp5.getController("Green")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(35)
     ;
     cp5.getController("Blue")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(35)
     ;
     cp5.getController("Random")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(35)
     ;
     cp5.getController("Disco")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(35)
     ;
     cp5.getController("Mix")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(32)
     ;
     cp5.getController("White")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(32)
     ;
      cp5.getController("Close")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(32)
     ;
}

void draw() {
  background(0);/*
  if (mouseOverRect() == true) {  // If mouse is over square,
    fill(204);                    // change color and
    myPort.write('M');              // send an H to indicate mouse is over square
  } 
  else {                        // If mouse is not over square,
    fill(0);                      // change color and
    myPort.write('Y');              // send an L otherwise
  }
  rect(50, 50, 100, 100);  */       // Draw a square
}

public void Blue() {
  myPort.write('M');
}
public void Green() {
  myPort.write('Y');
}
public void Red() {
  myPort.write('K');
}
public void Random() {
  myPort.write('R');
}
public void Mix() {
  myPort.write('Q');
}
public void Disco() {
  myPort.write('D');
}
public void White() {
  myPort.write('B');
}
public void Close() {
  myPort.write('C');
}
void exit(){
  myPort.write('X');
  super.exit();//let processing carry with it's regular exit routine
}