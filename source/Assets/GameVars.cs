using System.Collections.Generic;
using UnityEngine;

public class GameVars : Singleton<GameVars>
{
    public int lives;
    public int points;
    public float oldZ;
    public bool mute;
    public static GameVars Instance
    {
        get
        {
            return ((GameVars)mInstance);
        }
        set
        {
            mInstance = value;
        }
    }

    protected GameVars() {
        lives = 3;
        points = 0;
        oldZ = 0.0f;
        mute = false;
    }
}