; ===============================
; Ender-3 Extruder Calibration Test
; Purpose: Check 100 mm extrusion for E-steps/mm
; Filament: PLA
; Nozzle: 200°C, Bed: 60°C
; ===============================

; --- Start G-code ---
G21             ; Units in mm
G90             ; Absolute positioning
M82             ; Extruder absolute mode
M107            ; Fan off
M140 S60        ; Set bed temperature 60°C
M190 S60        ; Wait for bed temp
M104 S200       ; Set nozzle temperature 200°C
M109 S200       ; Wait for nozzle temp
G28             ; Home all axes
G92 E0          ; Reset extruder position

; --- Move to safe position ---
G1 X10 Y10 Z0.2 F3000 ; Move to front-left corner, first layer height

; --- Prime the nozzle ---
G1 E5 F200          ; Extrude 5 mm filament slowly to prime
G4 S2               ; Pause 2 seconds

; --- Extrusion test ---
; This command extrudes 100 mm at a slow speed
; Measure filament before and after to check accuracy
G1 E100 F100        ; Extrude 100 mm filament slowly
G4 S2               ; Pause 2 seconds

; --- Retract filament slightly ---
G1 E95 F200         ; Retract 5 mm to prevent oozing

; --- End G-code ---
G1 Z10 F1200        ; Lift nozzle
G1 X0 Y220 F3000    ; Move head away
M104 S0             ; Turn off nozzle
M140 S0             ; Turn off bed
M107                ; Turn off fan
M84                 ; Disable motors

; ===============================
; End of Extruder Calibration Test
; ===============================
