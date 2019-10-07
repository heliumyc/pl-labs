package body MatrixMult is

    task body MultTaskType is
        sum: Integer := 0;
    begin
        accept Start(A: in MyMat; B: in MyMat; val: out Integer; row: in Integer; col: in Integer) do
            for i in 1 .. SIZE loop
                sum := sum + A(row, i)*B(i, col);
            end loop;
            val := sum;
        end Start;
    end MultTaskType;

    function SumUP(mat: in MyMat) return Integer is
    total: Integer;
    begin
        total := 0;
        for i in 1 .. SIZE loop
            for j in 1 .. SIZE loop
                total := total + mat(i, j);
            end loop;
        end loop;
        return total;
    end SumUP;

    procedure MatMult(A: in MyMat; B: in MyMat; C: out MyMat) is
    MultTaskList: array(1 .. SIZE, 1 .. SIZE) of MultTaskType;
    begin
        for i in 1 .. SIZE loop
            for j in 1 .. SIZE loop
                MultTaskList(i, j).Start(A, B, C(i,j), i, j);
            end loop;
        end loop;
    end MatMult;

    procedure SequentialMatMult(A: in MyMat; B: in MyMat; C: out MyMat) is
    sum: Integer := 0;
    begin 
        for i in 1 .. SIZE loop
            for j in 1 .. SIZE loop
                sum := 0;
                for m in 1 .. SIZE loop
                    sum := sum + A(i, m)*B(m, j);
                end loop;
                C(i, j) := sum;
            end loop;
        end loop;
    end SequentialMatMult;
end MatrixMult;