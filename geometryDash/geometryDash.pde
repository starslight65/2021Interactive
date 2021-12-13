float [] badX, bubbleX, bubbleY;
void setup(){
  size(600,400);
  badX = new float[100];
  badX[0]=300+random(200,300);
  for(int i=1; i<100; i++){
    badX[i]=badX[i-1]+random(200,250);
  }
  bubbleX=new float[10];
  bubbleY=new float[10];
  for(int i=0; i<10; i++){
    bubbleX[i]=0;
    bubbleY[i]=300;
  }
}
float userY=300, vy=0, bgX=0;
void draw(){
  background(#1A73FF); 
  fill(#F5ADCF);
  for(int i=0; i<100; i++){
    triangle(badX[i]-bgX, 300, badX[i]-25-bgX,350, badX[i]-bgX+25,350); 
    rect(badX[i]-bgX, 20, 200,50);
    
  }
  fill(#FFAFF6); rect(0, 350, 600,400);
  rect(150, userY, 50,50);
  if(jumping){
    userY+=vy;
    vy += 0.98/2;//gravity
    if(userY>300){
      jumping=false;
      userY=300;
    }
  }
  for(int i=9; i>0; i--){
    bubbleX[i]=bubbleX[i-1];
    bubbleY[i]=bubbleY[i-1];
    fill(#FFF2F2);
    
    rect(bubbleX[i]+150-bgX,bubbleY[i],40,40);
  }
  bubbleX[0]=bgX;
  bubbleY[0]=userY;
  bgX+=3;
}
boolean jumping=false;
void keyPressed(){
  if(jumping==false){
    jumping=true;
    vy=-10;//jump upward
  }
}
