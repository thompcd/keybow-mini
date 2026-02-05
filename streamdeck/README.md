# Stream Deck → Keybow Mini Integration

## Setup

### 1. Find the COM port
- Open **Device Manager** on Windows
- Expand **Ports (COM & LPT)**
- Look for the Keybow's serial device (likely "USB Serial Device" or similar)
- Note the COM port number (e.g., COM3)

### 2. Update the scripts
- Edit each `.ps1` file and change `"COM3"` to your actual COM port

### 3. Add to Stream Deck
- In Stream Deck software, drag a **System → Open** action onto a button
- Set the app to: `powershell.exe`
- Set arguments to: `-ExecutionPolicy Bypass -File "C:\path\to\keybow-red.ps1"`
- Repeat for each color button

### Available commands
| Script | Effect |
|--------|--------|
| `keybow-off.ps1` | All LEDs off |
| `keybow-red.ps1` | All LEDs red |
| `keybow-green.ps1` | All LEDs green |

### Custom colors
For any RGB color, create a script with:
```powershell
$port = New-Object System.IO.Ports.SerialPort "COM3", 9600
$port.Open()
$port.WriteLine("rgb:255,128,0")  # Orange
$port.Close()
```
