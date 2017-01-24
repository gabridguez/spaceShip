using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using System.IO;
using System.Linq;

public class Escena : MonoBehaviour
{

    GameObject ship;
    Vector3 actualPosition;
    float actualAngle = -90;
    float zAnillos = 0f;
    public Canvas GameOver;
    public Text lives;
    public Text points;
    Queue<GameObject> anillos;


    void Awake()
    {
        GameOver.enabled = false;
    }
    //public int lives;
    // Use this for initialization
    void Start()
    {
        //plano();
        //abeto();
        //escalera();
        //lives = GameVars.Instance.lives;
        //Color blue = new Color(0.0f, 0.0f, 1.0f);
        //Tunel("Tunel número: "+i,0.1f*i);
        //GameVars.Instance.asteroid = (Texture)Resources.Load("Metal Textures pack/pattern 21/Metal pattern 21");
        //GameVars.Instance.asteroid = Resources.Load("Metal textures pack/pattern 21/Metal pattern 21.mat") as Material;


        ship = GameObject.Find("Ship");
        //ship.GetComponent<MeshRenderer>().material.color = Color.blue;
        //ship.AddComponent<MeshCollider>();
        //ship.AddComponent<SphereCollider>().enabled=true;
        //ship.AddComponent<MeshRenderer>();
        //ship.AddComponent<MeshRenderer>().material.color = blue;
        //ship.GetComponent<Collider>()=new Collider();
        //ship.SetComponent<Collider>()=new MeshCollider();
        actualPosition = new Vector3(0, -0.8f, 0);
        ship.transform.position = actualPosition;
        anillos = Tunel("tunel");
    }

    // Update is called once per frame
    void Update()
    {
        if (GameVars.Instance.lives > 0)
        {


            float alpha = 5;
            float speed = 0.001f;
            float r = 0.8f;

            Vector3 newPosition = actualPosition;
            if (Input.GetKey(KeyCode.LeftArrow))
            {
                ship.transform.Rotate(new Vector3(0, 0, -alpha));
                GameVars.Instance.oldZ -= alpha;
                actualAngle -= alpha;
                newPosition.x = r * Mathf.Cos(DegreeToRadian(actualAngle));
                newPosition.y = r * Mathf.Sin(DegreeToRadian(actualAngle));
            }
            if (Input.GetKey(KeyCode.RightArrow))
            {
                ship.transform.Rotate(new Vector3(0, 0, +alpha));
                GameVars.Instance.oldZ += alpha;
                actualAngle += alpha;
                newPosition.x = r * Mathf.Cos(DegreeToRadian(actualAngle));
                newPosition.y = r * Mathf.Sin(DegreeToRadian(actualAngle));
            }
            newPosition = newPosition + new Vector3(0, 0, 0.01f);
            //ship.transform.position = actualPosition;
            ship.transform.position = Vector3.MoveTowards(actualPosition, newPosition, speed * Time.deltaTime);

            actualPosition = newPosition;
            UpdateTunel(anillos);


        }
        else
        {

            //updateScoresFile();
            GameOver.enabled = true;
        }
        lives.text = "LiveS: x" + GameVars.Instance.lives;
        points.text = "Points: " + GameVars.Instance.points;
    }

    void updateScoresFile()
    {
        string path = @"GAME_DATA\Scores.txt";
        string[] scores = new string[10];
        if (!File.Exists(path))
        {
            // if the file doesn't exist lets create it
            scores.SetValue("10", 0);
            scores.SetValue("9", 1);
            scores.SetValue("8", 2);
            scores.SetValue("7", 3);
            scores.SetValue("6", 4);
            scores.SetValue("5", 5);
            scores.SetValue("4", 6);
            scores.SetValue("3", 7);
            scores.SetValue("2", 8);
            scores.SetValue("1", 9);
            //File.WriteAllLines(path, scores);
        }
        else
        {
            //recover information from the file to the array
            scores = System.IO.File.ReadAllLines(path);
        }

        //insert new score and reorder
       
        int[] newScores = new int[11];

        for (int i = 0; i < scores.Length; i++)
        {
            newScores[i] = System.Int32.Parse(scores[i]);
        }
        newScores.SetValue(GameVars.Instance.points, 10);
                
        newScores = newScores.OrderByDescending(i => i).ToArray();
        string[] newScoreString = new string[10];

        for (int i = 0; i < newScoreString.Length; i++)
        {
            newScoreString[i] = newScores[i].ToString();
        }
        
        //save to file
        File.Delete(path);
        File.WriteAllLines(path, newScoreString);
    }

    /* void OnGUI()
     {
         GUIStyle style= new GUIStyle();

         if (GameVars.Instance.lives > 0)
         {
             style.normal.textColor = Color.blue;
             GUI.Label(new Rect(10, 10, 100, 20), "Lives: x" + GameVars.Instance.lives, style);
             GUI.Label(new Rect(Screen.width-150, Screen.height-20, 50, 20), "Points: " + GameVars.Instance.points, style);
         }
         else
         {
             style.normal.textColor = Color.red;

             //GUI.Label(new Rect((Screen.width/2)-100,Screen.height/2 , 100, 20), "GAME OVER\nFinal Score: "+ GameVars.Instance.points, style);

         }

     }*/

    private float DegreeToRadian(float angle)
    {
        return Mathf.PI * angle / 180.0f;
    }

    private void UpdateTunel(Queue<GameObject> anillos)
    {
        if (actualPosition.z > (zAnillos - 2.5f) /*anillos.Peek()*/)
        {


            Destroy(anillos.Dequeue());
            GameObject Tunel = GameObject.Find("tunel");
            anillos.Enqueue(Tunel.AddComponent<Primitivas>().CrearCirculo("anillo " + (zAnillos * 10) / 2, 1.0f, zAnillos));
            createAsteroids();
            zAnillos = zAnillos + 0.2f;
        }
    }



    private Vector3[] getAsteroidPositions()
    {
        float alpha = 0.0f;
        float R = 0.8f;
        Vector3[] asteroidPositions = new Vector3[12];
        for (int i = 0; i < 12; i++)
        {
            asteroidPositions[i] = new Vector3(R * Mathf.Cos(DegreeToRadian(alpha)), R * Mathf.Sin(DegreeToRadian(alpha)), zAnillos);
            alpha += 30;
        }
        return asteroidPositions;
    }

    void createAsteroids()
    {
        Vector3[] positions = getAsteroidPositions();
        Color negro = new Color(0.0f, 0.0f, 0.0f);
        GameObject asteroidSource = GameObject.Find("asteroid");
        GameObject yellowPointsMat = GameObject.Find("YellowPoints");
        GameObject bluePointsMat = GameObject.Find("BluePoints");
        GameObject greenPointsMat = GameObject.Find("GreenPoints");
        //Material yourMaterial = (Material)Resources.Load("Metal pattern 21", typeof(Material));

        foreach (Vector3 position in positions)
        {
            if (Random.Range(0, 1000) > 950)
            {
                /*GameObject asteroid = new GameObject("asteroid");
                asteroid.AddComponent<Primitivas>().CrearEsfera();
                //asteroid.AddComponent<SphereCollider>();
                asteroid.AddComponent<SphereCollider>().radius =1.0f;
                //asteroid.AddComponent<MeshRenderer>().material.color = negro;
                //asteroid.AddComponent<MeshRenderer>();

                asteroid.AddComponent<MeshRenderer>().material = asteroidMat.GetComponent<MeshRenderer>().material;
                //asteroid.AddComponent<MeshRenderer>().material =Resources.Load("Metal textures pack/pattern 21/Metal pattern 21.mat") as Material;
                
                //asteroid.AddComponent<MeshRenderer>().material.mainTexture = Resources.Load("Metal textures pack/pattern 21/Metal pattern 21") as Texture;
                asteroid.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                asteroid.transform.position = position;*/
                GameObject asteroid = Instantiate<GameObject>(asteroidSource);
                asteroid.transform.localScale = new Vector3(0.2f, 0.2f, 0.2f);
                //points.AddComponent<SphereCollider>().radius = 0.5f;
                asteroid.transform.position = position;
            }
            else
            {
                if (Random.Range(0, 1000) > 950)
                {
                    /*GameObject points = new GameObject("pointsYellow");
                    points.AddComponent<Primitivas>().CrearEsfera();
                    points.AddComponent<SphereCollider>().radius = 1.0f;
                    points.AddComponent<MeshRenderer>().material = yellowPointsMat.GetComponent<MeshRenderer>().material;
                    points.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    points.transform.position = position;*/
                    GameObject points = Instantiate<GameObject>(yellowPointsMat);
                    points.transform.localScale = new Vector3(0.2f, 0.2f, 0.2f);
                    points.transform.position = position;

                }
                else
                {
                    if (Random.Range(0, 1000) > 996)
                    {
                        GameObject points = Instantiate<GameObject>(bluePointsMat);
                        points.transform.localScale = new Vector3(0.2f, 0.2f, 0.2f);
                        //points.AddComponent<SphereCollider>().radius = 0.5f;
                        points.transform.position = position;

                    }
                    else
                    {
                        if (Random.Range(0, 1000) > 990)
                        {
                            GameObject points = Instantiate<GameObject>(greenPointsMat);
                            points.transform.localScale = new Vector3(0.2f, 0.2f, 0.2f);
                            points.transform.position = position;

                        }

                    }

                }
            }
        }
    }
    Queue<GameObject> Tunel(string name)
    {
        int size = 30;
        GameObject Tunel = new GameObject(name);

        Queue<GameObject> anillos = new Queue<GameObject>(size);
        for (int i = 0; i < size; i++)
        {
            //Tunel.AddComponent<Primitivas>().CrearCirculo("anillo " + i, 1.0f, z);
            anillos.Enqueue(Tunel.AddComponent<Primitivas>().CrearCirculo("anillo " + i, 1.0f, zAnillos));
            zAnillos = zAnillos + 0.2f;
        }
        return anillos;

    }

    public void LoadMenu()
    {

        /* using (System.IO.StreamWriter file =
            new System.IO.StreamWriter(@"GAME_DATA\Scores.txt", true))
         {
             file.WriteLine("New Score "+ GameVars.Instance.points);
         }*/
        updateScoresFile();
        GameVars.Instance.points = 0;
        GameVars.Instance.lives = 3;
        SceneManager.LoadScene(0);
    }

    void plano()
    {
        GameObject Plano_P = new GameObject("plano");
        Plano_P.transform.localScale = new Vector3(50.0f, 50.0f, 50.0f);
        Plano_P.AddComponent<Primitivas>().CrearPlano();
        //Plano_P.AddComponent(Primitivas.CrearPlano());
        Plano_P.AddComponent<MeshRenderer>();

    }

    void abeto()
    {



        GameObject cono1;
        GameObject cono2;
        GameObject cono3;
        GameObject cilindro;
        Color verde = new Color(0.0f, 1.0f, 0.0f);
        Color marron = new Color(0.65f, 0.45f, 0.4f);

        cono1 = new GameObject("cono1");
        cono1.AddComponent<Primitivas>().CrearCono();
        cono1.AddComponent<MeshRenderer>().material.color = verde;
        cono1.transform.localScale = new Vector3(0.75f, 1.0f, 0.75f);


        cono2 = new GameObject("cono2");
        cono2.AddComponent<Primitivas>().CrearCono();
        cono2.AddComponent<MeshRenderer>().material.color = verde;
        cono2.transform.localScale = new Vector3(0.5625f, 1.0f, 0.5625f);
        cono2.transform.position = new Vector3(0.0f, 0.125f, 0.0f);


        cono3 = new GameObject("cono3");
        cono3.AddComponent<Primitivas>().CrearCono();
        cono3.AddComponent<MeshRenderer>().material.color = verde;
        cono3.transform.localScale = new Vector3(0.42f, 1.0f, 0.42f);
        cono3.transform.position = new Vector3(0.0f, 0.25f, 0.0f);

        cilindro = new GameObject("cilindro");
        cilindro.AddComponent<Primitivas>().CrearCilindro();
        cilindro.AddComponent<MeshRenderer>().material.color = marron;
        cilindro.transform.localScale = new Vector3(0.1f, 1.0f, 0.1f);
        cilindro.transform.position = new Vector3(0.0f, -0.5f, 0.0f);



    }

    void escalera()
    {
        GameObject cilindro;
        Color marron = new Color(0.65f, 0.45f, 0.4f);

        cilindro = new GameObject("cilindro");
        cilindro.AddComponent<Primitivas>().CrearCilindro();
        cilindro.AddComponent<MeshRenderer>().material.color = marron;
        cilindro.transform.localScale = new Vector3(0.1f, 1.0f, 0.1f);
        cilindro.transform.position = new Vector3(0.0f, -0.0f, 0.0f);
    }
}
