# SGI Software Guild – SITAMS

Responsive React + Vite website starter using React Router and Lucide React.

## Run locally
1. Install Node.js 18+ (Node.js 20 LTS recommended).
2. Extract this ZIP and open the project folder in VS Code.
3. Open Terminal and run:
   ```bash
   npm install
   npm run dev
   ```
4. Open the local URL printed by Vite, usually `http://localhost:5173`.

## Production build
```bash
npm run build
npm run preview
```

## Central team data
Edit `src/data/teamMembers.js`. It contains 36 initial records with unique IDs, designations, departments, image paths, biography, education, skills, experience, responsibilities, achievements, projects, and professional links.

Routes include `/team/ceo-01`, `/team/hr-01`, `/team/manager-01`, `/team/frontend-01` through `frontend-11`, `/team/backend-01` through `backend-16`, and `/team/database-01` through `database-06`.

Replace placeholder names and personal details with verified, approved information. To mark the correct frontend core team leader, add `"isTeamLeader": true` only to that member's object after confirming their identity.

Edit department names, counts, descriptions, and icons in `src/data/departments.js`.

## Images
Replace `public/images/logo.png` with the official logo. Replace the image paths defined in `teamMembers.js` with actual member photographs. Missing photos gracefully display an elegant flower illustration. No generated human faces are used.

Expected image folders:
- `public/images/leadership/ceo.jpg`, `hr.jpg`, `manager.jpg`
- `public/images/team/frontend/frontend-01.jpg` through `frontend-11.jpg`
- `public/images/team/backend/backend-01.jpg` through `backend-16.jpg`
- `public/images/team/database/database-01.jpg` through `database-06.jpg`

## Routes
`/`, `/about`, `/departments`, `/departments/:id`, `/team`, `/team/:id`, `/contact`.

For production hosting, configure your static host to fall back to `index.html` for unknown paths so direct profile URLs and browser refresh work.

Before publishing, confirm reporting lines, leadership names, the frontend team leader, biographies, contact details, and all personal links.
