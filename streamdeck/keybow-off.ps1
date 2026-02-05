# Stream Deck → Keybow: LEDs Off
# Set COM_PORT to match your Keybow's serial port (check Device Manager → Ports)
$port = New-Object System.IO.Ports.SerialPort "COM3", 9600
$port.Open()
$port.WriteLine("off")
$port.Close()
