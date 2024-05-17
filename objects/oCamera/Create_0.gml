/// @desc Set up camera
cam = view_camera[0];
follow = oPlayer;
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;

// Shake params
shake_time = 0;
shake_magnitude = 0;
shake_remain_x = 0;
shake_remain_y = 0;
shake_random = true;
flipper = 0;
flip_frames = CAMERA_SHAKE_SMOOTHNESS;