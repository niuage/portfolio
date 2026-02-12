---
title: "2D Water Simulation"
date: "02/07/2026"
category: games
thumbnail: project_1_thumbnail.png
video: "videos/portfolio_water_sim.webm"
icon: games
description: "Real-Time 2D Fluid Simulation, GPU Particle Water for Unity URP"
---

> If you're here for support on the Unity Package, please reach out to niuage\[at\]gmail.com.

Most 2D games handle water with a row of spring-connected points that bob up and down when something falls in. It works okay for surface ripples, but nothing actually flows. Water can't pour, fill a container, or slosh around obstacles. It's really just a surface effect.

I wanted something closer to the real thing.

## Actual fluid dynamics, not springs on a string

This system simulates water as **thousands of individual particles running entirely on the GPU**. Every drop is a physical entity that pushes against its neighbors, flows through gaps, and responds to gravity and collisions on its own.

The physics solver uses **double-density relaxation**, a technique designed specifically for particle-based fluids. It handles **pressure**, **viscosity**, and **surface tension**, and produces liquid behavior that pools, splashes, and settles without any hand-authored animation.

You can really feel the difference. Drop an object into spring-based water and you get a nice symmetrical ripple. Drop it into this and the water displaces, rushes to fill the gap behind the object, and sloshes against the walls. It behaves like water because it's actually simulated like water.

## Making the GPU do the heavy lifting

Simulating thousands of particles means every one of them needs to know about its neighbors every single frame. That's a lot of lookups, which is exactly the kind of thing GPUs are good at.

- **Spatial lookups** use a **counting sort**, an O(n) algorithm that only needs **4 compute shader dispatches** to bucket every particle into a spatial grid. Bitonic sort would need around 91 dispatches for the same job.
- **Collision handling** generates a **Signed Distance Field** on the GPU using the Jump Flood Algorithm. Particles know how far they are from every nearby collider and respond with smooth, gradient-based forces, so water flows along curves instead of stuttering against edges.

## It looks like water, not like particles

Raw particles look terrible. The rendering pipeline turns them into a convincing fluid surface with a **two-pass approach**:

1. Each particle renders as a soft, overlapping blob into an offscreen buffer
2. A threshold pass turns that density field into a clean surface with smooth edges (the classic **metaball technique**, tuned for 2D and plugged into Unity's sprite sorting system)

The water layers correctly with everything else in the scene without any sorting hacks. Velocity data gets baked into the render buffer too, so fast-moving water can pick up foam tints or color shifts, which is a small thing but it really sells the effect.

## Objects that actually float

Buoyancy isn't bolted on as an afterthought. A dedicated manager **batches GPU queries** for all floating objects in a single dispatch, so there are no per-object raycasts and no CPU-side water level guessing. Objects push particles aside as they move through the water, and the water pushes back. The interaction is **two-way** and runs at simulation speed.

## The boring parts that matter

- **Async GPU readback** so the CPU never stalls waiting on particle counts
- **Pre-allocated buffers** with zero runtime allocation
- **Static emitters** that cache their data and skip redundant uploads
- **Ambient turbulence injection** to keep the water from going unnaturally still
- **Cross-platform UV handling** that runs the same on DirectX, Metal, Vulkan, and OpenGL without platform-specific branches

None of that is fun to talk about, but it's what separates a simulation that works in a demo from one that can actually ship in a game.
