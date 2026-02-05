# Stream Deck → Keybow: LEDs Red
$port = New-Object System.IO.Ports.SerialPort "COM3", 9600
$port.Open()
$port.WriteLine("red")
$port.Close()
