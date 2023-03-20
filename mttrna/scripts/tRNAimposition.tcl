# Procedure for taking a tRNA & imposing on another tRNA
# By: Mihir Gowda

proc runthru {} {
    # set <custom name> <atomselect with conditions>
    # atomselect <mol ID> <"name P" for phosphate atoms, 
        # "and residue X to Y" for subselection of phosphates>
        # Subselection if molecules have different amounts of phosphates

    # Molecule 1
    # Note: aligning on first 70 residues only due to differences in sequence length
    set psel1 [atomselect 1 "name P and residue 0 to 69"]
    # Molecule 2 (basis for comparison)
    set psel2 [atomselect 2 "name P"]

    # measure <command (only fit for this purpose)> <molecule 1> <molecule 2>
    # map first onto second
    set M [measure fit $psel1 $psel2]

    # get all the atoms of Molecule 1
    set all1 [atomselect 1 "all"]

    # apply the transition matrix
    $all1 move $M
}

# Run the procedure here
runthru