function matlab_example_loopback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletRS232;
    import java.lang.String;

    % For this example connect the RX1 and TX pin to receive the send message

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    rs232 = BrickletRS232(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register read callback to function cb_read
    set(rs232, 'ReadCallbackCallback', @(h, e) cb_read(e));

    rs232.enableReadCallback();
    rs232.write(string_to_char_array(String('test')), 4);

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end

% Callback function for read callback
function cb_read(e)
    fprintf('Message (length: %g): %s\n', e.length, e.message);
end

% Convert string to array of length 60 as needed by write
function char_array = string_to_char_array(message)
    import java.util.Arrays;
    char_array = Arrays.copyOf(message.toCharArray(), 60);
end