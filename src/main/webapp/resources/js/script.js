/**
 * 
 */
/*

// Helper to show Toastr notifications
function showToast(type, message) {
  toastr.options = {
    closeButton: true,
    progressBar: true,
    positionClass: "toast-top-right",
    timeOut: "3000"
  };
  toastr[type](message);
}

// ==== AUTH: Login ====
async function login(event) {
  event.preventDefault();
  const email    = document.getElementById('email').value;
  const password = document.getElementById('password').value;
  const role     = document.getElementById('roleSelector')?.value || 'STUDENT';

  try {
    const res = await fetch('/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password })
    });

    if (res.ok) {
      showToast('success', 'Login successful! Redirecting…');
      localStorage.setItem('userRole', role);
      // assume userId returned or default
      setTimeout(() => window.location.href = '/dashboard', 1000);
    } else {
      const err = await res.text();
      showToast('error', err || 'Invalid credentials');
    }
  } catch (e) {
    showToast('error', 'Network error—please try again.');
  }
}

// ==== AUTH: Register ====
async function registerStudent(event) {
  event.preventDefault();
  const name     = document.getElementById('studentName').value;
  const email    = document.getElementById('studentEmail').value;
  const password = document.getElementById('studentPassword').value;
  const course   = document.getElementById('studentCourse').value;
  const semester = parseInt(document.getElementById('studentSemester').value, 10);

  try {
    const res = await fetch('/auth/register', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, email, password, role: 'STUDENT', course, semester })
    });

    if (res.ok) {
      showToast('success', 'Registration successful! Redirecting…');
      setTimeout(() => window.location.href = '/dashboard', 1000);
    } else {
      const err = await res.text();
      showToast('warning', err || 'Registration failed');
    }
  } catch (e) {
    showToast('error', 'Network error—please try again.');
  }
}

// ==== JOBS: Load & Render ====
async function loadJobs() {
  try {
    const res = await fetch('/jobs');
    if (!res.ok) return showToast('error', 'Failed to load jobs');
    const jobs = await res.json();
    const container = document.getElementById('jobsContainer');
    container.innerHTML = jobs.length
      ? jobs.map(j => `
        <div class="job-card">
          <h3>${j.title}</h3>
          <p>${j.description}</p>
          <p><strong>Location:</strong> ${j.location}</p>
          <p><strong>Salary:</strong> ${j.salary}</p>
          <button class="btn btn-primary" onclick="openJob(${j.id})">View & Apply</button>
        </div>
      `).join('')
      : '<p>No jobs available.</p>';
  } catch (e) {
    showToast('error', 'Error loading jobs');
  }
}

// ==== JOBS: Post & Edit ====
async function postJob(event) {
  event.preventDefault();
  const form = document.getElementById('postJobForm');
  const data = {
    title:           form.title.value,
    description:     form.description.value,
    location:        form.location.value,
    salary:          form.salary.value,
    eligibleCourse:  form.eligibleCourse.value,
    eligibleSemester: parseInt(form.eligibleSemester.value, 10)
  };

  try {
    const res = await fetch('/jobs/post', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
    if (res.ok) {
      showToast('success', 'Job posted!');
      form.reset();
      loadJobs();
    } else {
      const err = await res.text();
      showToast('error', err || 'Error posting job');
    }
  } catch (e) {
    showToast('error', 'Network error—please try again.');
  }
}

async function updateJob(event) {
  event.preventDefault();
  const form = document.getElementById('editJobForm');
  const data = {
    id:              parseInt(form.id.value, 10),
    title:           form.title.value,
    description:     form.description.value,
    location:        form.location.value,
    salary:          form.salary.value,
    eligibleCourse:  form.eligibleCourse.value,
    eligibleSemester: parseInt(form.eligibleSemester.value, 10)
  };

  try {
    const res = await fetch('/jobs/post/edit', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
    if (res.ok) {
      showToast('success', 'Job updated!');
      setTimeout(() => window.location.href = '/jobs', 800);
    } else {
      const err = await res.text();
      showToast('error', err || 'Error updating job');
    }
  } catch (e) {
    showToast('error', 'Network error—please try again.');
  }
}

// ==== APPLICATION: Apply ====
async function applyForJob(jobId) {
  const resume = prompt('Enter resume URL or file path:');
  if (!resume) return showToast('info', 'Resume required');
  try {
    const res = await fetch('/applications/apply', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ student: { id: localStorage.getItem('userId') }, job: { id: jobId }, resume })
    });
    if (res.ok) {
      showToast('success', 'Application submitted!');
      document.querySelector(`#applyBtn-${jobId}`).disabled = true;
    } else {
      showToast('warning', 'You are not eligible');
    }
  } catch (e) {
    showToast('error', 'Network error—please try again.');
  }
}

// ==== PROFILE: Save ====
async function saveProfile(event) {
  event.preventDefault();
  const form = document.getElementById('profileForm');
  const data = new FormData(form);

  try {
    const res = await fetch('/profile', {
      method: 'POST',
      body: data
    });
    if (res.ok) {
      showToast('success', 'Profile updated!');
    } else {
      showToast('error', 'Error saving profile');
    }
  } catch (e) {
    showToast('error', 'Network error—please try again.');
  }
}

// ==== STUDENTS: Load & Filter (Admin) ====
async function loadStudents() {
  const params = new URLSearchParams(new FormData(document.getElementById('studentFilterForm')));
  try {
    const res = await fetch('/admin/students?' + params.toString());
    if (!res.ok) return showToast('error', 'Failed to load students');
    const students = await res.json();
    const tbody = document.getElementById('studentsTableBody');
    tbody.innerHTML = students.map((s,i) => `
      <tr>
        <td>${i+1}</td>
        <td>${s.name}</td>
        <td>${s.email}</td>
        <td>${s.course}</td>
        <td>${s.semester}</td>
        <td>${new Date(s.createdAt).toLocaleDateString()}</td>
      </tr>
    `).join('');
  } catch(e) {
    showToast('error', 'Error loading students');
  }
}

// ==== Initialization ====
document.addEventListener('DOMContentLoaded', () => {
  // Bind forms if they exist
  document.getElementById('loginForm')?.addEventListener('submit', login);
  document.getElementById('studentRegistrationForm')?.addEventListener('submit', registerStudent);
  document.getElementById('postJobForm')?.addEventListener('submit', postJob);
  document.getElementById('editJobForm')?.addEventListener('submit', updateJob);
  document.getElementById('profileForm')?.addEventListener('submit', saveProfile);
  document.getElementById('studentFilterForm')?.addEventListener('submit', e => { e.preventDefault(); loadStudents(); });

  // Initial data loads
  loadJobs();
  if (document.getElementById('studentsTableBody')) loadStudents();
});

*/