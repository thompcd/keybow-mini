# Stream Deck → Keybow: LEDs Green
$port = New-Object System.IO.Ports.SerialPort "COM3", 9600
$port.Open()
$port.WriteLine("green")
$port.Close()
