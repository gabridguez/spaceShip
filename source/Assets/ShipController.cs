using UnityEngine;
using System.Collections;
using System;
using UnityEngine.SceneManagement;

public class ShipController : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    void OnTriggerEnter(Collider col) {
        //Console.WriteLine("collision detected");
        //GameObject a = new GameObject();
        //a.AddComponent<Primitivas>().CrearCilindro();
        //a.AddComponent<MeshRenderer>();
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name.Equals("asteroid(Clone)"))
        {
            col.gameObject.GetComponent<AudioSource>().Play();
            col.gameObject.GetComponent<Renderer>().enabled = false;
            col.gameObject.GetComponent<SphereCollider>().enabled = false;
            Destroy(col.gameObject,3.0f);

            GameVars.Instance.lives = GameVars.Instance.lives - 1;
            //System.Threading.Thread.Sleep(2000);
            /*if (GameVars.Instance.lives > 0)
            {
                System.Threading.Thread.Sleep(2000);
                SceneManager.LoadScene(SceneManager.GetActiveScene().name);
                
            }*/
          
        }else
        {
            if (col.gameObject.name.Equals("YellowPoints(Clone)"))
            {
                col.gameObject.GetComponent<AudioSource>().Play();
                col.gameObject.GetComponent<SphereCollider>().enabled = false;
                col.gameObject.GetComponent<Renderer>().enabled = false;
                Destroy(col.gameObject, 3.0f);
                //col.gameObject.SetActive( false);
                GameVars.Instance.points = GameVars.Instance.points + 25;
            }
            else
            {
                if (col.gameObject.name.Equals("BluePoints(Clone)"))
                {
                    col.gameObject.GetComponent<AudioSource>().Play();
                    col.gameObject.GetComponent<SphereCollider>().enabled = false;
                    col.gameObject.GetComponent<Renderer>().enabled = false;
                    Destroy(col.gameObject, 3.0f);
                    //col.gameObject.SetActive(false);
                    GameVars.Instance.lives = GameVars.Instance.lives + 1;
                    GameVars.Instance.points = GameVars.Instance.points + 50;
                }
                else
                {
                    if (col.gameObject.name.Equals("GreenPoints(Clone)"))
                    {
                        col.gameObject.GetComponent<AudioSource>().Play();
                        col.gameObject.GetComponent<SphereCollider>().enabled = false;
                        col.gameObject.GetComponent<Renderer>().enabled = false;
                        Destroy(col.gameObject, 3.0f);
                       // col.gameObject.SetActive(false);
                        GameVars.Instance.points = GameVars.Instance.points + 500;
                    }
                }
            }
        }
        
        
        
        //Console.WriteLine("collision detected");
        //GameObject ship = GameObject.Find("ship");
        //GameObject a = new GameObject();
        //a.AddComponent<Primitivas>().CrearCilindro();
        //a.AddComponent<MeshRenderer>();
        //ship.AddComponent<MeshRenderer>().material.color=new Color(0.0f,0.0f,1.0f);
    }
}
