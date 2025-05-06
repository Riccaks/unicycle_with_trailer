# Unicycle Robot with Trailer – Front-Wheel and Rear-Wheel Drive Models

This repository contains MATLAB and Simulink simulations of a **unicycle robot pulling a trailer**,
with both **front-wheel drive** and **rear-wheel drive** configurations. The simulations model the
robot's motion using kinematic equations and applies a Lyapunov-based control law to follow a desired trajectory.

Each configuration is organized into its own subdirectory with dedicated scripts, Simulink models, and plots.

## Repository Structure

```
.
├── front-wheel drive/          # Simulation of front-wheel drive unicycle with trailer
│   ├── image-1.png             # Diagram or plot
│   ├── image-2.png             # Lyapunov control law image
│   ├── image-3.png             # Desired trajectory image
│   ├── image.png               # Kinematic model image
│   ├── init_params_unicycle.m # Initialization script
│   ├── model_plot.m           # Visualization script
│   ├── unicycle_w_trailer.slx # Simulink model
│   ├── unicycle_w_trailer.slxc# Simulink cache
│   ├── slprj/                  # Auto-generated Simulink files
│   └── README.md              # Documentation for this model
│
├── rear-wheel drive/           # Simulation of rear-wheel drive unicycle with trailer
│   ├── rear_wheeled_bicycle.png    # Kinematic model image
│   ├── rw_init_params_unicycle.m  # Initialization script
│   ├── rw_model_plot.m            # Visualization script
│   ├── rw_unicycle_w_trailer.slx # Simulink model
│   └── README.md                  # Documentation for this model
│
└── rob2stab.pdf               # Related academic or theoretical documentation (e.g. report or paper)
```

## Overview

This project investigates the control of a unicycle-type mobile robot pulling a passive trailer.
Two common configurations are explored:

- **Front-Wheel Drive (FWD):** The front wheel is actuated with both forward motion and steering input.
- **Rear-Wheel Drive (RWD):** The rear wheel provides motion while the front steering determines direction.

Both models aim to follow a straight-line path along the **y-axis** using a **Lyapunov-based control law** to
stabilize the system and minimize lateral and angular error.

## How to Use

To simulate either model:

1. Navigate into either `front-wheel drive/` or `rear-wheel drive/`.
2. Run the corresponding initialization script to define model parameters.
3. Open and simulate the Simulink model.
4. Run the plotting script to visualize the results.

Example (for rear-wheel drive):
```matlab
cd('rear-wheel drive')
rw_init_params_unicycle
open('rw_unicycle_w_trailer.slx')
rw_model_plot
```

## Requirements

- MATLAB (tested with R2021a or later)
- Simulink

## Notes

- The `rob2stab.pdf` file provides additional theoretical background or may be the reference paper/report.
- Simulation output and cache files (`slprj/`, `.slxc`) are auto-generated and can be deleted if needed.

## License

This project is intended for academic and research purposes. Feel free to use, modify, and cite as appropriate.
