function octave_example_loopback()
    more off;

    % For this example connect the RX1 and TX pin to receive the send message

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your RS232 Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    rs232 = javaObject("com.tinkerforge.BrickletRS232", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register read callback to function cb_read
    rs232.addReadCallback(@cb_read);

    % Enable read callback
    rs232.enableReadCallback();

    % Write "test" string
    rs232.write(string2chars("test"), 4);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for read callback
function cb_read(e)
    message = java_invoke("java.util.Arrays", "copyOf", e.message, e.length);
    len = java2int(e.length)

    fprintf("Message (Length: %d): \"%s\"\n", len, chars2string(e.message, len));
end

% Convert string to array of length 60 as needed by write
function chars = string2chars(string)
    chars = javaArray("java.lang.String", 60);

    for i = 1:length(string)
        chars(i) = substr(string, i, 1);
    end

    for i = length(string)+1:60
        chars(i) = "x";
    end
end

% Assume that the message consists of ASCII characters and
% convert it from an array of chars to a string
function string = chars2string(chars, len)
    string = "";

    for i = 1:len
        string = strcat(string, chars(i));
    end
end

function int = java2int(value)
    if compare_versions(version(), "3.8", "<=")
        int = value.intValue();
    else
        int = value;
    end
end
