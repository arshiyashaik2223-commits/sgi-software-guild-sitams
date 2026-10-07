const API_BASE_URL = 'http://localhost:8080/api';

async function fetchDepartments() {
    try {
        const response = await fetch(`${API_BASE_URL}/departments`);
        return await response.json();
    } catch (error) {
        console.error('Error fetching departments:', error);
        return [];
    }
}

async function fetchTeamMembers() {
    try {
        const response = await fetch(`${API_BASE_URL}/members`);
        return await response.json();
    } catch (error) {
        console.error('Error fetching team members:', error);
        return [];
    }
}

async function renderTeam() {
    const members = await fetchTeamMembers();
    
    // If the database is empty, keep showing the hardcoded HTML
    if (members.length === 0) {
        console.log("No members in database. Showing hardcoded HTML.");
        return;
    }

    // Map the database department names to the HTML grid containers
    const departmentSections = {
        'Leadership & Operations': document.querySelector('#leadership .member-grid'),
        'Frontend Development': document.querySelector('#frontend .member-grid'),
        'Backend Development': document.querySelector('#backend .member-grid'),
        'Database & Data Integrity': document.querySelector('#database .member-grid')
    };

    // Clear the hardcoded members from all grids
    Object.values(departmentSections).forEach(container => {
        if (container) container.innerHTML = '';
    });

    // Render the members from the database into the appropriate grids
    members.forEach(member => {
        // Get department name from the nested object
        const departmentName = member.department ? member.department.name : 'Unknown';
        const container = departmentSections[departmentName];
        
        if (container) {
            const article = document.createElement('article');
            article.className = 'member';
            article.innerHTML = `
                <img src="${member.imageUrl || 'images/default-avatar.png'}" alt="${member.name}" class="member-photo">
                <h3>${member.name}</h3>
                <p class="role">${member.designation}</p>
                <a class="text-link" href="profiles.html#${member.memberId}">View Profile ↗</a>
            `;
            container.appendChild(article);
        }
    });
}

async function loadStats() {
    try {
        const response = await fetch(`${API_BASE_URL}/stats`);
        if (response.ok) {
            const data = await response.json();
            document.getElementById('stat-members').innerText = data.membersCount;
            document.getElementById('stat-departments').innerText = data.departmentsCount;
        }
    } catch (error) {
        console.error('Error fetching stats:', error);
        // Fallback to original hardcoded values if the server fails
        document.getElementById('stat-members').innerText = '34';
        document.getElementById('stat-departments').innerText = '6';
    }
}

async function renderProfile() {
    const hash = window.location.hash.substring(1);
    const loading = document.getElementById('loading-spinner');
    const errorBlock = document.getElementById('profile-error');
    const profileCard = document.getElementById('dynamic-profile');

    if (!hash) {
        loading.style.display = 'none';
        errorBlock.style.display = 'block';
        return;
    }

    const members = await fetchTeamMembers();
    const member = members.find(m => m.memberId === hash);

    loading.style.display = 'none';

    if (!member) {
        errorBlock.style.display = 'block';
        return;
    }

    // Populate the template
    document.getElementById('dyn-avatar-text').innerText = member.name.charAt(0).toUpperCase();
    document.getElementById('dyn-name').innerText = member.name;
    document.getElementById('dyn-role').innerText = member.designation;
    document.getElementById('dyn-department').innerText = member.department ? member.department.name : 'Unknown';
    
    if (member.biography) {
        document.getElementById('dyn-about').innerText = member.biography;
    } else {
        document.getElementById('dyn-about').innerText = `Hello, my name is ${member.name}. I am a dedicated member of the ${member.department ? member.department.name : 'SGI Software Guild'} team.`;
    }

    profileCard.style.display = 'block';
}

async function loadDepartmentStats() {
    try {
        const members = await fetchTeamMembers();
        
        let frontend = 0;
        let backend = 0;
        let database = 0;
        
        members.forEach(member => {
            if (member.department) {
                if (member.department.name === 'Frontend Development') frontend++;
                if (member.department.name === 'Backend Development') backend++;
                if (member.department.name === 'Database & Data Integrity') database++;
            }
        });
        
        document.getElementById('card-size-frontend').innerText = frontend;
        document.getElementById('detail-size-frontend').innerText = frontend;
        
        document.getElementById('card-size-backend').innerText = backend;
        document.getElementById('detail-size-backend').innerText = backend;
        
        document.getElementById('card-size-database').innerText = database;
        document.getElementById('detail-size-database').innerText = database;
        
    } catch (error) {
        console.error('Error fetching department stats:', error);
        // Fallback to hardcoded values
        document.getElementById('card-size-frontend').innerText = '11';
        document.getElementById('detail-size-frontend').innerText = '11';
        document.getElementById('card-size-backend').innerText = '16';
        document.getElementById('detail-size-backend').innerText = '16';
        document.getElementById('card-size-database').innerText = '6';
        document.getElementById('detail-size-database').innerText = '6';
    }
}

// Run the script when the page loads
document.addEventListener('DOMContentLoaded', () => {
    // If we are on team.html or root
    if (window.location.pathname.includes('team.html')) {
        renderTeam();
    }
    
    // If we are on profiles.html
    if (window.location.pathname.includes('profiles.html')) {
        renderProfile();
    }
    
    // If we are on departments.html
    if (window.location.pathname.includes('departments.html')) {
        loadDepartmentStats();
    }
    
    // If we are on the homepage, load the dynamic stats
    if (window.location.pathname.includes('index.html') || window.location.pathname === '/' || window.location.pathname.endsWith('frontend/')) {
        loadStats();
    }
    
    // Setup contact form if it exists on the page
    const contactForm = document.querySelector('.contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', async (e) => {
            e.preventDefault(); // Stop page from refreshing
            
            const feedbackDiv = document.getElementById('form-feedback');
            const submitBtn = contactForm.querySelector('button');
            
            // Collect data
            const data = {
                name: document.getElementById('name').value,
                email: document.getElementById('email').value,
                subject: document.getElementById('subject').value,
                message: document.getElementById('message').value
            };
            
            submitBtn.disabled = true;
            submitBtn.innerText = 'Sending...';
            
            try {
                const response = await fetch(`${API_BASE_URL}/contact`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                
                if (response.ok) {
                    feedbackDiv.style.color = 'green';
                    feedbackDiv.innerText = '✅ Your message was sent successfully and saved to the database!';
                    contactForm.reset();
                } else {
                    throw new Error('Server returned an error.');
                }
            } catch (error) {
                feedbackDiv.style.color = 'red';
                feedbackDiv.innerText = '❌ Failed to send message. Is the server running?';
            } finally {
                submitBtn.disabled = false;
                submitBtn.innerText = 'Submit message ↗';
            }
        });
    }
});
