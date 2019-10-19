with MatrixMult, Ada.Text_IO, Ada.Integer_Text_IO;
use MatrixMult, Ada.Text_IO, Ada.Integer_Text_IO;

procedure AssignmentMain is

    -- reader type
    task type ReaderType is
        entry Read(Mat: out MyMat);
    end ReaderType;

    task body ReaderType is
    begin
        accept Read(Mat: out MyMat) do
            for i in 1 .. MatrixMult.SIZE loop
                for j in 1 .. MatrixMult.SIZE loop
                    Get(Mat(i, j));
                end loop;
            end loop;
        end Read;
    end ReaderType;

    -- printer type
    task type PrinterType is
        entry Print(Mat: in MyMat);
    end PrinterType;

    task body PrinterType is
    begin
        accept Print(Mat: in MyMat) do
            for i in 1 .. MatrixMult.SIZE loop
                for j in 1 .. MatrixMult.SIZE loop
                    Put(Mat(i, j));
                    Put(" ");
                end loop;
                New_Line;
            end loop;
            New_Line;
        end Print;
    end PrinterType;

    Read1: ReaderType;
    Read2: ReaderType;
    Printer: PrinterType;

    A: MyMat;
    B: MyMat;
    C: MyMat;

begin
    Read1.Read(A);
    Read2.Read(B);

    MatMult(A, B, C);
    --SequentialMatMult(A, B, C);
    
    Printer.Print(C);
end AssignmentMain;