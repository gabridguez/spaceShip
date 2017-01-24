using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.IO;

public class MainMenu : MonoBehaviour {

    public Canvas MainCanvas;
    public Canvas OptionsCanvas;
    GameObject panel;
    
    void Awake()
    {
        panel=GameObject.Find("ScoresPanel");
        panel.SetActive(false);
        OptionsCanvas.enabled = false;
    }

    public void OptionsOn()
    {
        OptionsCanvas.enabled = true;
        MainCanvas.enabled = false;
    }

    public void MainOn()
    {
        OptionsCanvas.enabled = false;
        MainCanvas.enabled = true;
    }

    public void DoStartNewGame()
    {
        SceneManager.LoadScene(1);
    }
    public void DoMuteUnmute()
    {
        
        //OptionsCanvas.GetComponentInChildren<Button>().GetComponentInChildren<Text>().text = "Sound is Off";
        
        GameVars.Instance.mute=!GameVars.Instance.mute;
    }

    public void DoResetScores()
    {
        File.Delete(@"GAME_DATA\Scores.txt");
    }

    public void DoCloseScores()
    {
        panel.SetActive(false);
    }
    public void DoQuit()
    {
        Application.Quit();
    }
    public void DoShowScores()
    {
        
        string path = @"GAME_DATA\Scores.txt";
        string[] scores = new string[10];
        if (!File.Exists(path))
        {
            // if the file doesn't exist lets create it
            scores.SetValue("10",0);
            scores.SetValue("9", 1);
            scores.SetValue("8", 2);
            scores.SetValue("7", 3);
            scores.SetValue("6", 4);
            scores.SetValue("5", 5);
            scores.SetValue("4", 6);
            scores.SetValue("3", 7);
            scores.SetValue("2", 8);
            scores.SetValue("1", 9);
            File.WriteAllLines(path, scores);
        }else
        {
            //recover information from the file to the array
            scores=System.IO.File.ReadAllLines(path);
        }
        
        //show in the UI
        Text[] textos = new Text[10];
        //panel.AddComponent<Text>();
            textos=panel.GetComponentsInChildren<Text>();
        for (int i = 0; i < scores.Length; i++)
        {
            textos[i].text = scores[i];
        }
        panel.SetActive(true);

        
    }
}
