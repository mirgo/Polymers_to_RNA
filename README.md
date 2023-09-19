# Polymers and RNA

## Introduction

Hey all!
This is a project where I explore the compaction of branched polymers and translate those dynamics towards the study of fluctuations and nulceotide mechanics of mitchondrial tRNA (mt-tRNA) molecules.

### Prerequisites

Instructions are below for downloading the softwares used in the project and working with the files in this repository. 

These assume a Windows OS, downloading and working with a Linux Subterminal (Personally worked through Windows Subsystem for Linux 2). Modify accordingly for Apple OS.  

Windows Workflow
1. Ensure Windows Powershell is installed. 
2. Ensure Windows Subsystem for Linux (WSL) is installed. Preferably WSL2. 
3. Activate WSL2. 
```
wsl.exe
Sudo apt-get update
Sudo apt-get install curl
```

For all following code, 
1. {shape} refers to any shape string from (linear, N3B4, N5B4, plus, T)
2. {trial} refers to any trial number from (*blank*, 2, 3)
3. {mttrna} refers to any mt-tRNA from (leu, leuM, lys, lysM, met, val)
4. {traj} refers to trajectory trials from {sim_70, sim_70_2, sim_70_3}

## LAMMPS and Branched Polymers

### Organization

- Everything for use here is under `BPolymers`.
- Data files to enter in LAMMPS are under respective `BPolymers/data/{shape}`.
- Scripts for running in LAMMPS are under `BPolymers/scripts`, titled `branchedpolymer{shape}`.
- Scripts for creating or analyzing polymer data are under `BPolymers/scripts`, as `.ipynb` files.
- Trajectory files* are under `BPolymers/data/{shape}/trjs{trial}`.
- Log files are under `BPolymers/data/{shape}/logs{trial}`.

*Note, the largest trajectory files aren't included due to 100 MB size limit on Github.

### Running Simulations

```
env OMP_NUM_THREADS=2 lmp -sf omp -in *.lam

```
where * refers to the .lam file name. 

## GROMACS and mt-tRNA

### Organization

- Everything for use here is under `mttrna`.
- Scripts for running in GROMACS are under `mttrna/scripts`, as `.mdp` files.
- Scripts for measurements in VMD are under `mttrna/scripts`, as `.tcl` files.
- Scripts for analyzing mt-tRNA data are under `mttrna/scripts`, as `.ipynb` files.
- Tertiary PDB files for mt-tRNAs are under `mttrna/data/tertiary/{mttrna}` as `.pdb` files.
- Trajectory files are under `mttrna/data/tertiary/{mttrna}/{traj}` as `.xtc` files.*


*Note, some trajectory files aren't included again due to large file limits on Github.
