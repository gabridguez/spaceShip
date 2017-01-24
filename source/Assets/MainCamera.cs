using UnityEngine;
using System.Collections;

public class MainCamera : MonoBehaviour
{
    public Transform target;            // The position that that camera will be following.
    public float smoothing = 2f;        // The speed with which the camera will be following.

    Vector3 offset;                     // The initial offset from the target.

    void Start()
    {
        // Calculate the initial offset.
        offset = transform.position - target.position;

        AudioSource audio = GetComponent<AudioSource>();
        if (GameVars.Instance.mute)
        {
            audio.mute = true;
        }
        else
        {
            audio.mute = false;
        }
    }

    
    void FixedUpdate()
    {

        // Create a postion the camera is aiming for based on the offset from the target.
        //Vector3 targetCamPos = target.position + offset;
        Vector3 targetCamPos = new Vector3(0,0,target.position.z+offset.z); 
        // Smoothly interpolate between the camera's current position and it's target position.
        transform.position = Vector3.Lerp(transform.position, targetCamPos, smoothing * Time.deltaTime);
        //transform.rotation=target.rotation;
        transform.RotateAround(transform.position, Vector3.forward, (GameVars.Instance.oldZ -target.rotation.z));
        GameVars.Instance.oldZ = target.rotation.z;
    }
}
