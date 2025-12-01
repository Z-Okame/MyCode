int parse_cli(int argc, char *argv[]) {

    if (argc == 0  || argv[0] == "-n" ) {
        //call generate_ip()
    }
    else if (argc >= 1) {
    char* temp = argv[0];
    if ((temp[0] == "-" && temp[1] == "n") && (temp[2] >= '0' && temp[2] <= '9')) {
        int n = temp[2] - '0';
    }
}
}