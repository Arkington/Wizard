/// @desc Set up camera
cam = view_camera[0];
follow = objPlayer;
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;

// Shake params
shakeLength = 0;
shakeMagnitude = 0;
shakeRemainX = 0;
shakeRemainY = 0;
shakeRandom = true;
flipper = 0;
flip_frames = CAMERA_SHAKE_SMOOTHNESS;