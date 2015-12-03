      SUBROUTINE INSERT(NCOL,NROW,NDOF,NGRID,JCORE,Z,DZ,TEMP,DTEMP,IPR)
C
C INSERT INSERTS MATRIX PARTITONS INTO OPEN CORE FOR IS2D8
C
      DIMENSION Z(1),TEMP(9)
      DOUBLE PRECISION DZ(1),DTEMP(9)
C
      IS1=NGRID*NDOF**2
C
C COMPUTE STARTING POINTS INTO OPEN CORE FOR THIS PARTITION AND ITS TRAN
C
      IZ1=IS1*(NROW-1)+NDOF*(NCOL-1)+JCORE-1
      IZ2=IS1*(NCOL-1)+NDOF*(NROW-1)+JCORE-1
C
C IZ1 GETS TEMP,  IZ2 GETS THE TRANSPOSE
C
      I1=IZ1
      I2=IZ2
C
      IF (IPR.EQ.2) GO TO 20
C
      IF(NDOF.EQ.1)GO TO 10
C
C 3 X 3 PARTITION
C I1 GETS TEMP. I2 GETS THE TRANSPOSE
C IF I1=I2, THEN HALF OF THE ENTRIES WILL BE DUPLICATED
C THAT-S OK SINCE THERE ARE NO ADDITIONS
C
      Z(I1+1)=TEMP(1)
      Z(I2+1)=TEMP(1)
      Z(I1+2)=TEMP(2)
      Z(I2+25)=TEMP(2)
      Z(I1+3)=TEMP(3)
      Z(I2+49)=TEMP(3)
      Z(I1+25)=TEMP(4)
      Z(I2+2)=TEMP(4)
      Z(I1+26)=TEMP(5)
      Z(I2+26)=TEMP(5)
      Z(I1+27)=TEMP(6)
      Z(I2+50)=TEMP(6)
      Z(I1+49)=TEMP(7)
      Z(I2+3)=TEMP(7)
      Z(I1+50)=TEMP(8)
      Z(I2+27)=TEMP(8)
      Z(I1+51)=TEMP(9)
      Z(I2+51)=TEMP(9)
      GO TO 100
C
C 1 X 1 PARTITION
C
   10 Z(I1+1)=TEMP(1)
      Z(I2+1)=TEMP(1)
      GO TO 100
C
C
C DO THE SAME IN DOUBLE PRECISION
C
   20 IF (NDOF.EQ.1) GO TO 30
C
      DZ(I1+ 1)=DTEMP(1)
      DZ(I2+ 1)=DTEMP(1)
      DZ(I1+ 2)=DTEMP(2)
      DZ(I2+25)=DTEMP(2)
      DZ(I1+ 3)=DTEMP(3)
      DZ(I2+49)=DTEMP(3)
      DZ(I1+25)=DTEMP(4)
      DZ(I2+ 2)=DTEMP(4)
      DZ(I1+26)=DTEMP(5)
      DZ(I2+26)=DTEMP(5)
      DZ(I1+27)=DTEMP(6)
      DZ(I2+50)=DTEMP(6)
      DZ(I1+49)=DTEMP(7)
      DZ(I2+ 3)=DTEMP(7)
      DZ(I1+50)=DTEMP(8)
      DZ(I2+27)=DTEMP(8)
      DZ(I1+51)=DTEMP(9)
      DZ(I2+51)=DTEMP(9)
      GO TO 100
C
   30 DZ(I1+1)=DTEMP(1)
      DZ(I2+1)=DTEMP(1)
C
  100 RETURN
      END