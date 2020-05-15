import java.util.List;
Circulo c1, c2, c3, tmp;
List <Circulo>lista;
String q="";
float x,y;
int n = -1; //para el id del circulo
int k = 30;
int w = 0;

void setup()
{
  size(400,300);
  lista = new <Circulo>ArrayList();
  tmp = null;
  for (int i = 0; i < k; i++)
  {
    x = random(width);
    y = random(height);
    tmp = new Circulo(x,y,50,w);
    w++;
    lista.add(tmp);    
  }   
}

void draw()
{
  background(0);
  for(int i = 0; i < lista.size(); i++)
  {
    tmp = lista.get(i);
    if(tmp.mover == true){
      tmp.setXY(mouseX, mouseY);
    }
    tmp.dibuja();
  }
  textSize(24);
  fill(#7d7d7d);
  text("Circulo Seleccionado: "+q, 20, 20);
  fill(255);  
}

void mousePressed()
{
  q="";
  for(int i = lista.size()-1; i>=0; i--)
  {
     tmp = lista.get(i);
     if (tmp.isAdentro(mouseX,mouseY))
     {
       n = tmp.id;
       q += tmp.id;
       tmp.setMove(true);
       break;
     }   
  }
}

void mouseReleased()
{
  tmp = lista.get(parseInt(q));
  q = "";
  n = -1; //no se esta seleccionado ningun circulo
  tmp.setMove(false);
  tmp = null;
}
