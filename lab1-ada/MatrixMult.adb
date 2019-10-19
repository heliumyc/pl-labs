package body MatrixMult is



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

        task type MultTaskType is
            entry Start(row: in Integer; col: in Integer);
        end MultTaskType;

        task body MultTaskType is
            sum: Integer := 0;
            curRow: Integer := 0;
            curCol: Integer := 0;
        begin
            accept Start(row: in Integer; col: in Integer) do
                curRow := row;
                curCol := col;
            end Start;
            for i in 1 .. SIZE loop
                sum := sum + A(curRow, i)*B(i, curCol);
            end loop;
            C(curRow, curCol) := sum;
        end MultTaskType;

        MultTaskList: array(1 .. SIZE, 1 .. SIZE) of MultTaskType;
    begin
        for i in 1 .. SIZE loop
            for j in 1 .. SIZE loop
                MultTaskList(i, j).Start(i, j);
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