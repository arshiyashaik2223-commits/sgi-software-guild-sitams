$headers = @{"Content-Type"="application/json"}

$dept3 = Invoke-RestMethod -Uri "http://localhost:8080/api/departments" -Method Post -Headers $headers -Body '{"name":"Backend Development"}'
$dept4 = Invoke-RestMethod -Uri "http://localhost:8080/api/departments" -Method Post -Headers $headers -Body '{"name":"Database & Data Integrity"}'

$depts = Invoke-RestMethod -Uri "http://localhost:8080/api/departments" -Method Get
$dept1 = $depts | Where-Object name -eq 'Leadership & Operations'
$dept2 = $depts | Where-Object name -eq 'Frontend Development'

function Add-Member {
    param($memberId, $name, $role, $img, $dept)
    $body = @{
        memberId = $memberId
        name = $name
        designation = $role
        imageUrl = $img
        department = $dept
    } | ConvertTo-Json -Depth 3
    Invoke-RestMethod -Uri "http://localhost:8080/api/members" -Method Post -Headers $headers -Body $body
}

# Leadership
Add-Member "hr" "V.BHAVYA SREE" "Human Resources" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.05 PM.jpeg" $dept1
Add-Member "manager" "K Kiranmai" "Team Manager" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.58 AM.jpeg" $dept1

# Frontend 
Add-Member "frontend-03" "Harika" "Frontend Core Co-Team Lead" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.16.10 PM.jpeg" $dept2
Add-Member "frontend-04" "J Himaja" "Frontend Core Member 03" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.09.00 PM.jpeg" $dept2
Add-Member "frontend-05" "D N Vasu Sree" "Frontend Core Member 04" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.09.09 PM.jpeg" $dept2
Add-Member "frontend-06" "D G Poojitha Lakshmi" "Frontend Core Member 05" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.09.21 PM.jpeg" $dept2
Add-Member "frontend-07" "G M DARACTHA MEHATHAJ" "Frontend Core Member 06" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.09.21 PM (1).jpeg" $dept2
Add-Member "frontend-08" "PS RAJASREE" "Frontend Core Member 07" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.16.18 PM.jpeg" $dept2
Add-Member "frontend-09" "N. Anusha" "Frontend Core Member 08" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.37 PM.jpeg" $dept2
Add-Member "frontend-10" "N. Chandana" "Frontend Core Member 09" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.36 PM.jpeg" $dept2
Add-Member "frontend-11" "M.Akshaya" "Frontend Core Member 10" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.35 PM.jpeg" $dept2
Add-Member "frontend-12" "N.Roshitha" "Frontend Core Member 11" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.34 PM.jpeg" $dept2

# Backend
Add-Member "backend-01" "N.Manoj Kumar" "Backend core Team Leader" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.16.57 PM.jpeg" $dept3
Add-Member "backend-02" "P Hima Bindhu" "Backend Member 02" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.03 PM.jpeg" $dept3
Add-Member "backend-03" "V.M.Moulika" "Backend Member 03" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.01 PM (1).jpeg" $dept3
Add-Member "backend-04" "R.Thejaswi" "Backend Member 04" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.02 PM (1).jpeg" $dept3
Add-Member "backend-05" "S MOHAN" "Backend Member 05" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.02 PM.jpeg" $dept3
Add-Member "backend-06" "S.Harshitha" "Backend Member 06" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.04 PM.jpeg" $dept3
Add-Member "backend-07" "V BINDU PRIYA" "Backend Member 07" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.04 PM (1).jpeg" $dept3
Add-Member "backend-08" "V.BHAVYA SREE" "Backend Member 08" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.08.05 PM.jpeg" $dept3
Add-Member "backend-09" "S.pranathi" "Backend Member 09" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.16.24 PM.jpeg" $dept3
Add-Member "backend-10" "P Hemasree" "Backend Member 10" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.16.33 PM.jpeg" $dept3
Add-Member "backend-11" "VIRUPAKSHAPURAM ROHITH" "Backend Member 11" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.29.05 AM.jpeg" $dept3
Add-Member "backend-12" "K Kiranmai" "Backend Member 12" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.58 AM.jpeg" $dept3
Add-Member "backend-13" "K Bharath" "Backend Member 13" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.58 AM (1).jpeg" $dept3
Add-Member "backend-14" "Vijaya Lakshmi" "Backend Member 14" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.56 AM.jpeg" $dept3
Add-Member "backend-15" "SIRANA YUGESH ROYAL" "Backend Member 15" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.56 AM (1).jpeg" $dept3
Add-Member "backend-16" "PAKALA MOULI" "Backend Member 16" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.55 AM.jpeg" $dept3

# Database
Add-Member "database-01" "K.S.KEERTHANA" "Team Leader Database" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.05.32 PM.jpeg" $dept4
Add-Member "database-02" "NARAYANAREDDYGARI DEEPIKA" "Database member 02" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.58 AM (2).jpeg" $dept4
Add-Member "database-03" "N.POOJITHA" "Database member 03" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.05.34 PM.jpeg" $dept4
Add-Member "database-04" "R.Bhavishya" "Database member 04" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.05.33 PM (1).jpeg" $dept4
Add-Member "database-05" "K Harshini Naina" "Database member 05" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-06 at 10.28.57 AM.jpeg" $dept4
Add-Member "database-06" "C Bhavya sree" "Database member 06" "C:\Users\ARSHIYA\Downloads\WhatsApp Image 2026-10-05 at 7.05.33 PM.jpeg" $dept4
