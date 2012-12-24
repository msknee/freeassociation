/* Free-Association Engine
* Shelly Ni
* Oct 8, 2012
*/

String dataLocation = "words.csv";
String [][] words; // 2D array for storing words
String adj ="";
String noun = "";
String verb = "";
String welcomeString1 = "Wondering what to draw?";
String welcomeString2 = "Ask The Free Association Engine";
int rowLength=0; // variable for storing # of words in each row
int rowNumber=0; // variable for storing # of rows in "words" array
int randomAdj=0;
int randomNoun=0;
int randomVerb=0;
int randomLength=39;
boolean clearText=false;


void setup() {
  
size(1280,768);
background(255);


//calculate max width of csv file

String wordsBeforeSplit[] = loadStrings(dataLocation);
rowNumber = wordsBeforeSplit.length;

for (int i=0; i < rowNumber; i++) {
  String [] row=split(wordsBeforeSplit[i],',');
  if (row.length>rowLength){
    rowLength=row.length;
  }
}

//create csv array based on # of rows and columns in csv file
words = new String [rowNumber][rowLength];

//parse values into 2d array
for (int i=0; i < rowNumber; i++) {
  String [] temp = new String [rowNumber];
  temp= split(wordsBeforeSplit[i], ',');
  for (int j=0; j < temp.length; j++){
   words[i][j]=temp[j];
  }
}
}

void draw() {

  randomAdj = int(random(randomLength));
  randomNoun = int(random(randomLength));
  randomVerb = int(random(randomLength));
  adj = words[0][randomAdj];
  noun = words[1][randomNoun];
  verb = words[2][randomVerb];

  fill(220);
  textSize(36);
  text(welcomeString1, 450,75);
  fill(0);
  textSize(72);
  text(welcomeString2, 100,150);
  

  if (clearText == false) {
    fill(255);
  rect(0,200,width,height/9);
  rect(0,300,width,height/9);
  rect(0,400,width,height/9);
  
      textSize(36);
  fill(0);
    text("?", 650, 250);
    text("?", 650, 350);
    text("?", 650, 450);
  }
}

void mousePressed() {
 
  fill(0);
  textSize(36);
  
  if (mouseY < 285 && mouseY > 200) {
     clearText = true;
     fill(255);
     noStroke();
     rect(0,210,width/1.25,height/11);
     fill(0);
     text(adj, 600,250);
     
  } else if (mouseY < 385 && mouseY > 300) {
    
     clearText = true;
     fill(255);
     noStroke();
     rect(0,310,width/1.25,height/11);
     fill(0);
     text(noun, 600,350);
    
  } else if (mouseY < 485 && mouseY > 400) {
    
     clearText = true;
     fill(255);
     noStroke();
     rect(0,410,width/1.25,height/11);
     fill(0);
     text(verb, 600,450);
    
  }

}
  

