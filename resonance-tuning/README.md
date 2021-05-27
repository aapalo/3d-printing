## X axis

`pi@mainsailos:~/moonraker $ ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o /tmp/shaper_calibrate_x.png`

1: first measurement
```
Fitted shaper 'zv' frequency = 83.2 Hz (vibrations = 30.7%, smoothing ~= 0.029)
To avoid too much smoothing with 'zv', suggested max_accel <= 27000 mm/sec^2
Fitted shaper 'mzv' frequency = 54.6 Hz (vibrations = 3.0%, smoothing ~= 0.068)
To avoid too much smoothing with 'mzv', suggested max_accel <= 8800 mm/sec^2
Fitted shaper 'ei' frequency = 73.4 Hz (vibrations = 6.3%, smoothing ~= 0.060)
To avoid too much smoothing with 'ei', suggested max_accel <= 10000 mm/sec^2
Fitted shaper '2hump_ei' frequency = 68.2 Hz (vibrations = 0.0%, smoothing ~= 0.116)
To avoid too much smoothing with '2hump_ei', suggested max_accel <= 5200 mm/sec^2
Fitted shaper '3hump_ei' frequency = 82.0 Hz (vibrations = 0.0%, smoothing ~= 0.122)
To avoid too much smoothing with '3hump_ei', suggested max_accel <= 4900 mm/sec^2
Recommended shaper is 2hump_ei @ 68.2 Hz
```

2: add two-sided tape behind ADXL, fasten the clamp nuts, bump accel limit 9k -> 10k, 
```
Fitted shaper 'zv' frequency = 76.8 Hz (vibrations = 28.9%, smoothing ~= 0.033)
To avoid too much smoothing with 'zv', suggested max_accel <= 23000 mm/sec^2
Fitted shaper 'mzv' frequency = 53.2 Hz (vibrations = 2.1%, smoothing ~= 0.072)
To avoid too much smoothing with 'mzv', suggested max_accel <= 8300 mm/sec^2
Fitted shaper 'ei' frequency = 71.6 Hz (vibrations = 5.3%, smoothing ~= 0.063)
To avoid too much smoothing with 'ei', suggested max_accel <= 9500 mm/sec^2
Fitted shaper '2hump_ei' frequency = 69.2 Hz (vibrations = 0.0%, smoothing ~= 0.113)
To avoid too much smoothing with '2hump_ei', suggested max_accel <= 5300 mm/sec^2
Fitted shaper '3hump_ei' frequency = 83.2 Hz (vibrations = 0.0%, smoothing ~= 0.118)
To avoid too much smoothing with '3hump_ei', suggested max_accel <= 5100 mm/sec^2
Recommended shaper is mzv @ 53.2 Hz
```

3: tighten the carriage rollers
```
Fitted shaper 'zv' frequency = 74.6 Hz (vibrations = 29.4%, smoothing ~= 0.034)
To avoid too much smoothing with 'zv', suggested max_accel <= 21700 mm/sec^2
Fitted shaper 'mzv' frequency = 53.4 Hz (vibrations = 2.8%, smoothing ~= 0.071)
To avoid too much smoothing with 'mzv', suggested max_accel <= 8400 mm/sec^2
Fitted shaper 'ei' frequency = 72.0 Hz (vibrations = 6.2%, smoothing ~= 0.062)
To avoid too much smoothing with 'ei', suggested max_accel <= 9700 mm/sec^2
Fitted shaper '2hump_ei' frequency = 68.0 Hz (vibrations = 0.0%, smoothing ~= 0.117)
To avoid too much smoothing with '2hump_ei', suggested max_accel <= 5100 mm/sec^2
Fitted shaper '3hump_ei' frequency = 81.4 Hz (vibrations = 0.0%, smoothing ~= 0.124)
To avoid too much smoothing with '3hump_ei', suggested max_accel <= 4900 mm/sec^2
Recommended shaper is 2hump_ei @ 68.0 Hz
```
## Y axis

```
Fitted shaper 'zv' frequency = 62.0 Hz (vibrations = 48.6%, smoothing ~= 0.047)
To avoid too much smoothing with 'zv', suggested max_accel <= 15000 mm/sec^2
Fitted shaper 'mzv' frequency = 48.4 Hz (vibrations = 30.7%, smoothing ~= 0.087)
To avoid too much smoothing with 'mzv', suggested max_accel <= 6900 mm/sec^2
Fitted shaper 'ei' frequency = 65.4 Hz (vibrations = 33.0%, smoothing ~= 0.075)
To avoid too much smoothing with 'ei', suggested max_accel <= 8000 mm/sec^2
Fitted shaper '2hump_ei' frequency = 43.6 Hz (vibrations = 22.1%, smoothing ~= 0.284)
To avoid too much smoothing with '2hump_ei', suggested max_accel <= 2000 mm/sec^2
Fitted shaper '3hump_ei' frequency = 54.6 Hz (vibrations = 19.2%, smoothing ~= 0.275)
To avoid too much smoothing with '3hump_ei', suggested max_accel <= 2100 mm/sec^2
Recommended shaper is zv @ 62.0 Hz
```
