void setup() {
  size(1000,1000);
  background(255);
  
  XML xml = loadXML("renewable-energy-investment-of-gdp.xml");
  XML[] countries = xml.getChildren("country");
 
  XML gdp, factor;
  float rectHeight = -800; //Standardhöhe der Säulen
  
  textAlign(CENTER);
  textSize(14); //Textgröße von Ländernamen und BIP
  
  for (int i = 0; i < countries.length; i++){
       gdp = countries[i].getChild("Percent_of_GDP");
       factor = countries[i].getChild("factor");
       
       fill(28,134,238); //Säulenfarbe
       rect(25+i*100, 900, 50, rectHeight*factor.getFloatContent()); //Zeichnen der Säulen
      
       fill(0); //Textfarbe
       text(countries[i].getString("code"), 50+i*100, 920);  //Zeichnen der Ländernamen
       text(gdp.getContent(), 50+i*100, 890 + rectHeight*factor.getFloatContent()); // Zeichnen des BIP in Prozent
        
  }
  
  textSize(20); //Textgröße der Überschrift
  text("Investment in Renewable Energy in Percent of GPD (2015)", 500, 50); //Zeichnen der Überschrift

}
