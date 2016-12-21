# ~/.bash_aliases: Custom aliases:

# General commands ---------------------------------------------------
alias ll='ls -alF'
alias cm25='cd /g/data/gh5/access_cm_025-picontrol'

# Latex diff:
ltexdiff() {
    latexdiff $1 $2 > $3 && pdflatex $3 && pdflatex $3
}

# data paths ---------------------------------------------------------
export nciCM="/g/data/gh5"
export ccrcDAT='/srv/ccrc/data03/z3500785'
export nciDAT='/short/e14/rmh561'
export nciGDAT='/g/data/e14/rmh561'

# ssh aliases: -------------------------------------------------------
# RAIJIN:
alias sshraijin='ssh -X rmh561@raijin.nci.org.au'
alias sftpraijin='sftp rmh561@raijin.nci.org.au'

export rsraijin='rmh561@raijin.nci.org.au'

# CCRC Storm Servers:
alias sshmaelstrom='ssh -X z3500785@maelstrom.ccrc.unsw.edu.au'
alias sshmonsoon='ssh -X z3500785@monsoon.ccrc.unsw.edu.au'
alias sshblizzard='ssh -X z3500785@blizzard.ccrc.unsw.edu.au'
alias sshsquall='ssh -X z3500785@squall.ccrc.unsw.edu.au'
alias sshhurricane='ssh -X z3500785@hurricane.ccrc.unsw.edu.au'
alias sshcyclone='ssh -X z3500785@cyclone.ccrc.unsw.edu.au'
alias sshtyphoon='ssh -X z3500785@typhoon.ccrc.unsw.edu.au'

export rsstorm='z3500785@cyclone.ccrc.unsw.edu.au'

# LINUX BOXES:
alias sshccrc='ssh -X z3500785@ccrc175.ccrc.unsw.edu.au'
alias sftpccrc='sftp z3500785@ccrc175.ccrc.unsw.edu.au'
alias sshmaths='ssh -X z3500785@matht265.maths.unsw.edu.au'
alias sftpmaths='sftp z3500785@matht265.maths.unsw.edu.au'

export rsccrc='z3500785@ccrc175.ccrc.unsw.edu.au'
export rsmaths='z3500785@matht265.maths.unsw.edu.au'



