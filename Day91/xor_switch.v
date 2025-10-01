module xor_switch (
    input a, b,
    output y
);
    wire n1, n2;

    pmos (n1, 1'b1, a);
    nmos (n1, b, a);

    pmos (n2, 1'b1, b);
    nmos (n2, a, b);

    pmos (y, n1, n2);
    nmos (y, n1, n2);
endmodule

