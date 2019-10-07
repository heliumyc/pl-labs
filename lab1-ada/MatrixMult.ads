package MatrixMult is
    SIZE: constant Integer := 10;
    type MyMat is array(1 .. SIZE, 1 .. SIZE) of Integer;
    function SumUP(mat: in MyMat) return Integer;
    procedure MatMult(A: in MyMat; B: in MyMat; C: out MyMat);
    procedure SequentialMatMult(A: in MyMat; B: in MyMat; C: out MyMat);

    task type MultTaskType is
        entry Start(A: in MyMat; B: in MyMat; val: out Integer; row: in Integer; col: in Integer);
    end MultTaskType;

end MatrixMult;

