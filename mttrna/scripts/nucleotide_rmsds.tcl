# Generate the RMSD of each nucleotide in a larger nucleic acid
# relative to it's initialized frame. The center of the molecule is preserved. 
# By: Mihir Gowda


proc rmsd_through_time {{mol 1}} {

    # Get number of frames to go through
    set num_steps [molinfo $mol get numframes]
    #set num_steps 100

    # Save the distances to a new csv file
    # set <variable name> <what variable equals>
    # open <file name> <open argument, "w" for writing>
    set f [open met_nucs_rmsds_abs.csv w]

    # Set to a number above any length of tRNAs 
    # (max is around 75 bases amongst Met, Val, Leu, and Lys)
    set resnum 80

    for {set a 0} {$a < $resnum} {incr a} {

        # use frame 0 for the reference
        set reference [atomselect $mol "residue $a" frame 0]
        # the frame being compared
        set compare [atomselect $mol "residue $a"]

        # Create an empty list (for all the displacements)
        set mylist {} 

        for {set frame 0} {$frame < $num_steps} {incr frame} {
            # get the correct frame
            $compare frame $frame

            # compute the transformation
            set trans_mat [measure fit $compare $reference]
            # do the alignment
            $compare move $trans_mat
            # compute the RMSD
            set rmsd [measure rmsd $compare $reference]

            # print the RMSD
            # puts "RMSD of $frame is $rmsd"

            #Add to big list
            lappend mylist $rmsd
        
        }

        puts $f "$mylist"
        puts $f "\n"
        
    }

    close $f
    
}

# run the procedure here
rmsd_through_time