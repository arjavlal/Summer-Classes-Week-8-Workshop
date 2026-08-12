/**
 * Antigravity Super-Advanced Interactive Engine for Arjav Lal Joshi's Portfolio
 * High performance, zero external dependencies, Web Audio API, Live REPL Simulator.
 */

document.addEventListener('DOMContentLoaded', () => {
    initTypewriter();
    initThemeSwitcher();
    initAudioFeedback();
    initTerminalSimulator();
    initProjectSystem();
    initScrollReveal();
    initMobileNav();
    initContactSystem();
    initProjectModal();
    initCardTiltEffect();

    // --- Premium "showroom" enhancements ---
    initScrollProgress();
    initNavbarScrollState();
    initScrollSpy();
    initStatCounters();
    initHeroImageTilt();
    initMagneticButtons();
    initMinecraftChatWidget();
});

/* --- Scroll Progress Bar ---
   Reads how far the user has scrolled through the document and writes
   that as a live-updating width on the thin bar injected at the top of
   <body>. Wrapped in requestAnimationFrame so it never fires more than
   once per paint, keeping scrolling smooth. */
function initScrollProgress() {
    const bar = document.getElementById('scrollProgress');
    if (!bar) return;

    let ticking = false;

    function updateProgress() {
        const scrollTop = window.scrollY;
        const docHeight = document.documentElement.scrollHeight - window.innerHeight;
        const progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;
        bar.style.width = `${Math.min(progress, 100)}%`;
        ticking = false;
    }

    window.addEventListener('scroll', () => {
        if (!ticking) {
            requestAnimationFrame(updateProgress);
            ticking = true;
        }
    }, { passive: true });

    updateProgress();
}

/* --- Navbar "Settle" State ---
   Toggles a .scrolled class once the page has moved away from the very
   top, so the navbar can pick up a shadow and tighten its padding —
   the same subtle chrome you get on premium product sites once the
   hero has scrolled out from under it. */
function initNavbarScrollState() {
    const navbar = document.querySelector('.navbar');
    if (!navbar) return;

    let ticking = false;

    function updateNavbar() {
        navbar.classList.toggle('scrolled', window.scrollY > 24);
        ticking = false;
    }

    window.addEventListener('scroll', () => {
        if (!ticking) {
            requestAnimationFrame(updateNavbar);
            ticking = true;
        }
    }, { passive: true });

    updateNavbar();
}

/* --- Scroll-Spy Navigation ---
   Watches every <section id="..."> that has a matching link in
   .nav-links, and marks that link .active whenever its section is the
   one currently centered in the viewport. Built with IntersectionObserver
   rather than a scroll-position calculation, so the browser only does
   the work when a section actually crosses the watched band. */
function initScrollSpy() {
    const navLinks = document.querySelectorAll('.nav-links a[href^="#"]');
    if (!navLinks.length) return;

    const linkMap = new Map();
    navLinks.forEach(link => {
        const id = link.getAttribute('href').slice(1);
        const section = document.getElementById(id);
        if (section) linkMap.set(section, link);
    });

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            const link = linkMap.get(entry.target);
            if (!link) return;
            if (entry.isIntersecting) {
                navLinks.forEach(l => l.classList.remove('active'));
                link.classList.add('active');
            }
        });
    }, {
        // Watch a thin horizontal band across the vertical middle of the
        // viewport, so a section only "counts" once it dominates the view.
        rootMargin: '-45% 0px -50% 0px',
        threshold: 0
    });

    linkMap.forEach((_link, section) => observer.observe(section));
}

/* --- Animated Stat Counters ---
   The hero stat cards (GPA, project count, compatibility %) sit at
   data-target values in the markup. Rather than showing them statically,
   this counts each one up from 0 the moment the stats band scrolls into
   view — a staple "confidence" moment on spec-sheet-heavy vehicle pages.
   Runs once per element via IntersectionObserver, then disconnects. */
function initStatCounters() {
    const statBand = document.querySelector('.hero-stats-band');
    const statEls = document.querySelectorAll('.stat-number[data-target]');
    if (!statBand || !statEls.length) return;

    function animateCount(el) {
        const targetStr = el.getAttribute('data-target');
        const target = parseFloat(targetStr);
        if (Number.isNaN(target)) return;

        // Whatever text isn't part of the numeric target (e.g. "+", "%")
        // is preserved and re-appended after each frame.
        const suffix = el.textContent.replace(targetStr, '');
        const decimals = targetStr.includes('.') ? targetStr.split('.')[1].length : 0;
        const duration = 1400;
        const start = performance.now();

        function tick(now) {
            const elapsed = Math.min((now - start) / duration, 1);
            // easeOutExpo — fast start, gentle settle onto the final number
            const eased = elapsed === 1 ? 1 : 1 - Math.pow(2, -10 * elapsed);
            const current = (target * eased).toFixed(decimals);
            el.textContent = `${current}${suffix}`;
            if (elapsed < 1) requestAnimationFrame(tick);
        }
        requestAnimationFrame(tick);
    }

    const observer = new IntersectionObserver((entries, obs) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                statEls.forEach(animateCount);
                obs.disconnect();
            }
        });
    }, { threshold: 0.4 });

    observer.observe(statBand);
}

/* --- Hero Image Showroom Tilt + Light Sheen ---
   Gives the hero photo a subtle 3D tilt that follows the cursor (like
   rotating a car on a showroom turntable), and dynamically creates a
   soft radial "sheen" element that tracks the pointer across the image,
   mimicking light sweeping across glossy paintwork. The sheen div isn't
   in the original markup — it's built and inserted here with
   document.createElement / appendChild. */
function initHeroImageTilt() {
    const wrapper = document.querySelector('.img-wrapper');
    const tiltTarget = document.querySelector('.hero-image');
    if (!wrapper || !tiltTarget) return;

    // Build and inject the sheen overlay via the DOM API.
    const sheen = document.createElement('div');
    sheen.className = 'image-sheen';
    sheen.setAttribute('aria-hidden', 'true');
    wrapper.appendChild(sheen);

    const maxTilt = 8; // degrees

    wrapper.addEventListener('mousemove', (e) => {
        const rect = wrapper.getBoundingClientRect();
        const xPct = (e.clientX - rect.left) / rect.width;
        const yPct = (e.clientY - rect.top) / rect.height;

        const rotateY = (xPct - 0.5) * maxTilt * 2;
        const rotateX = (0.5 - yPct) * maxTilt * 2;
        tiltTarget.style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale(1.015)`;

        sheen.style.setProperty('--sheen-x', `${xPct * 100}%`);
        sheen.style.setProperty('--sheen-y', `${yPct * 100}%`);
    });

    wrapper.addEventListener('mouseleave', () => {
        tiltTarget.style.transform = 'rotateX(0deg) rotateY(0deg) scale(1)';
    });
}

/* --- Magnetic Buttons ---
   Every .btn gently shifts toward the cursor as it approaches, then
   eases back to rest on mouseleave — the small, tactile "magnetic hover"
   micro-interaction common on premium automotive and product sites.
   The pull is deliberately subtle (25% of the cursor's offset from
   center, capped) so it reads as polish rather than gimmick. */
function initMagneticButtons() {
    const buttons = document.querySelectorAll('.btn');
    const strength = 0.25;
    const maxOffset = 8;

    buttons.forEach(btn => {
        btn.addEventListener('mousemove', (e) => {
            const rect = btn.getBoundingClientRect();
            const offsetX = e.clientX - (rect.left + rect.width / 2);
            const offsetY = e.clientY - (rect.top + rect.height / 2);

            const moveX = Math.max(Math.min(offsetX * strength, maxOffset), -maxOffset);
            const moveY = Math.max(Math.min(offsetY * strength, maxOffset), -maxOffset);

            btn.style.transform = `translate(${moveX}px, ${moveY}px)`;
        });

        btn.addEventListener('mouseleave', () => {
            btn.style.transform = 'translate(0, 0)';
        });
    });
}

/* --- Global Audio Feedback (Web Audio API Synthesizer) --- */
let soundEnabled = false;
let audioCtx = null;

function playClickSound(freq = 440, type = 'sine', duration = 0.05, volume = 0.18) {
    if (!soundEnabled) return;
    try {
        if (!audioCtx) audioCtx = new (window.AudioContext || window.webkitAudioContext)();
        if (audioCtx.state === 'suspended') audioCtx.resume();
        const osc = audioCtx.createOscillator();
        const gain = audioCtx.createGain();
        osc.type = type;
        osc.frequency.setValueAtTime(freq, audioCtx.currentTime);
        gain.gain.setValueAtTime(volume, audioCtx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.001, audioCtx.currentTime + duration);
        osc.connect(gain);
        gain.connect(audioCtx.destination);
        osc.start();
        osc.stop(audioCtx.currentTime + duration);
    } catch (e) {
        console.warn('Audio not available', e);
    }
}

function initAudioFeedback() {
    const soundToggle = document.getElementById('soundToggle');
    if (!soundToggle) return;

    soundToggle.addEventListener('click', () => {
        soundEnabled = !soundEnabled;
        soundToggle.classList.toggle('active', soundEnabled);
        soundToggle.style.color = soundEnabled ? 'var(--primary)' : 'var(--text-main)';
        if (soundEnabled) playClickSound(880, 'triangle', 0.08);
    });

    document.querySelectorAll('button, a, .theme-dot, .filter-btn').forEach(btn => {
        btn.addEventListener('mouseenter', () => playClickSound(300, 'sine', 0.03));
        btn.addEventListener('click', () => playClickSound(600, 'triangle', 0.05));
    });
}

/* --- Theme Accent Switcher --- */
function initThemeSwitcher() {
    const themeDots = document.querySelectorAll('.theme-dot');
    if (!themeDots.length) return;

    themeDots.forEach(dot => {
        dot.addEventListener('click', () => {
            const selectedTheme = dot.getAttribute('data-theme');
            themeDots.forEach(d => d.classList.remove('active'));
            dot.classList.add('active');
            
            if (selectedTheme === 'amber') {
                document.documentElement.removeAttribute('data-active-theme');
            } else {
                document.documentElement.setAttribute('data-active-theme', selectedTheme);
            }
        });
    });
}

/* --- Typewriter Effect --- */
function initTypewriter() {
    const targetElement = document.getElementById('typing-text');
    if (!targetElement) return;

    const phrases = [
        "AI & Embedded Systems Engineer",
        "Computing Undergraduate @ Islington",
        "IoT Hardware & MicroPython Creator",
        "Python CLI & Java Software Developer"
    ];

    let phraseIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    let typingSpeed = 80;

    function type() {
        const currentPhrase = phrases[phraseIndex];

        if (isDeleting) {
            targetElement.textContent = currentPhrase.substring(0, charIndex - 1);
            charIndex--;
            typingSpeed = 40;
        } else {
            targetElement.textContent = currentPhrase.substring(0, charIndex + 1);
            charIndex++;
            typingSpeed = 80;
        }

        if (!isDeleting && charIndex === currentPhrase.length) {
            typingSpeed = 2200;
            isDeleting = true;
        } else if (isDeleting && charIndex === 0) {
            isDeleting = false;
            phraseIndex = (phraseIndex + 1) % phrases.length;
            typingSpeed = 400;
        }

        setTimeout(type, typingSpeed);
    }

    type();
}

/* --- ESP32 MicroPython Live REPL Simulator --- */
function initTerminalSimulator() {
    const runBtn = document.getElementById('runTerminalBtn');
    const openBtn = document.getElementById('openTerminalBtn');
    const consoleBody = document.getElementById('terminalConsole');
    const heroTerminal = document.getElementById('heroTerminal');

    if (!consoleBody) return;

    const commands = [
        { cmd: "import parking_sensor, wifi", out: "[OK] Subsystems initialized on GPIO Pins 12, 14, 27." },
        { cmd: "parking_sensor.read_distance()", out: "Ultrasonic Distance: 42.8 cm (Slot 01: VACANT)" },
        { cmd: "wifi.get_status()", out: "WiFi SSID: 'Islington_AI_Lab' | RSSI: -48dBm (Excellent)" },
        { cmd: "parking_sensor.trigger_gate(True)", out: "Servo Motor Engaged -> Barrier Gate OPENED" },
        { cmd: "gc.mem_free()", out: "Free Memory: 3,148,800 bytes (78.7% available)" }
    ];

    let cmdIdx = 0;

    function executeNextCommand() {
        const item = commands[cmdIdx % commands.length];
        cmdIdx++;

        const lineCmd = document.createElement('div');
        lineCmd.className = 'term-line';
        lineCmd.innerHTML = `<span class="term-prompt">&gt;&gt;&gt;</span> ${item.cmd}`;

        const lineOut = document.createElement('div');
        lineOut.className = 'term-line term-out';
        lineOut.textContent = item.out;

        consoleBody.appendChild(lineCmd);
        consoleBody.appendChild(lineOut);
        consoleBody.scrollTop = consoleBody.scrollHeight;
    }

    if (runBtn) {
        runBtn.addEventListener('click', executeNextCommand);
    }

    if (openBtn && heroTerminal) {
        openBtn.addEventListener('click', () => {
            heroTerminal.scrollIntoView({ behavior: 'smooth', block: 'center' });
            heroTerminal.style.borderColor = 'var(--primary)';
            setTimeout(() => { heroTerminal.style.borderColor = 'var(--border-color)'; }, 1500);
            executeNextCommand();
        });
    }
}

/* --- Project Filtering, Live Search & View Toggle --- */
function initProjectSystem() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const projectCards = document.querySelectorAll('.project-card');
    const searchInput = document.getElementById('projectSearch');
    const gridViewBtn = document.getElementById('gridViewBtn');
    const listViewBtn = document.getElementById('listViewBtn');
    const projectsGrid = document.getElementById('projectsGrid');

    let activeFilter = 'all';
    let searchQuery = '';

    function filterProjects() {
        projectCards.forEach(card => {
            const category = card.getAttribute('data-category');
            const tags = (card.getAttribute('data-tags') || '').toLowerCase();
            const textContent = card.textContent.toLowerCase();

            const matchesCategory = (activeFilter === 'all' || category === activeFilter);
            const matchesSearch = !searchQuery || tags.includes(searchQuery) || textContent.includes(searchQuery);

            if (matchesCategory && matchesSearch) {
                card.classList.remove('hide');
            } else {
                card.classList.add('hide');
            }
        });
    }

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            filterButtons.forEach(btn => {
                btn.classList.remove('active');
                btn.setAttribute('aria-selected', 'false');
            });
            button.classList.add('active');
            button.setAttribute('aria-selected', 'true');
            activeFilter = button.getAttribute('data-filter');
            filterProjects();
        });
    });

    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            searchQuery = e.target.value.toLowerCase().trim();
            filterProjects();
        });
    }

    if (gridViewBtn && listViewBtn && projectsGrid) {
        gridViewBtn.addEventListener('click', () => {
            projectsGrid.classList.remove('list-view');
            gridViewBtn.classList.add('active');
            listViewBtn.classList.remove('active');
        });

        listViewBtn.addEventListener('click', () => {
            projectsGrid.classList.add('list-view');
            listViewBtn.classList.add('active');
            gridViewBtn.classList.remove('active');
        });
    }
}

/* --- Project Details Inspection Modal --- */
const projectSpecsData = {
    parking: {
        title: "Smart Parking System (ESP32 & MicroPython)",
        category: "IoT Hardware & Embedded Engineering",
        specs: [
            "Microcontroller: ESP32 Tensilica Dual-Core 240MHz",
            "Sensors: HC-SR04 Ultrasonic, FC-51 Infrared Occupancy",
            "Actuators: SG90 Micro Servo Gate Actuator, I2C 1602 LCD",
            "Networking: Integrated MicroPython async HTTP Web Server",
            "Language: MicroPython v1.20 with object-oriented sensor drivers"
        ],
        details: "Designed and engineered an automated vehicle management system. Features real-time distance calculations to trigger gate entry, live slot tracking broadcasted to a local web server interface, and fallback serial LCD updates."
    },
    aimanager: {
        title: "AI Model Subscription Manager (Java Swing)",
        category: "Desktop Application Architecture & GUI",
        specs: [
            "UI Framework: Java Swing with GridBagLayout & Custom Panels",
            "Architecture: MVC (Model-View-Controller) Clean Separation",
            "Data Processing: Flat-File IO state persistence & input regex validation",
            "Features: Full CRUD operations, filtering by API provider, cost calculator",
            "Target OS: Cross-platform JVM Execution"
        ],
        details: "Built to streamline tracking developer API keys and monthly expenditure across OpenAI, Anthropic, and Google Gemini models. Includes tabular layout, search bar, sorting, and user transaction history log."
    },
    medicine: {
        title: "Medicine Management System (Python CLI)",
        category: "System Software & Flat-File Storage",
        specs: [
            "Language: Python 3.11 Standard Library",
            "Storage Engine: Custom comma/tab delimited flat-file database",
            "Features: Real-time inventory check, invoice PDF generation, automated discount calculation",
            "Security: Role-based admin access control & error logging"
        ],
        details: "A modular CLI application designed for pharmacy inventory tracking. Handles low-stock threshold alerts, customer invoice generation, and modular file imports to maintain persistent stock levels across sessions."
    }
};

function initProjectModal() {
    const modalOverlay = document.getElementById('projectModal');
    const modalTitle = document.getElementById('modalTitle');
    const modalBody = document.getElementById('modalBodyContent');
    const modalClose = document.getElementById('modalCloseBtn');
    const inspectBtns = document.querySelectorAll('.inspect-project-btn');

    if (!modalOverlay || !modalTitle || !modalBody || !modalClose) return;

    function openModal(projectKey) {
        const data = projectSpecsData[projectKey];
        if (!data) return;

        modalTitle.textContent = data.title;
        modalBody.innerHTML = `
            <div class="modal-body-section">
                <h4>Category</h4>
                <p>${data.category}</p>
            </div>
            <div class="modal-body-section">
                <h4>Technical Specifications</h4>
                <ul>
                    ${data.specs.map(spec => `<li>${spec}</li>`).join('')}
                </ul>
            </div>
            <div class="modal-body-section">
                <h4>Architectural Details</h4>
                <p>${data.details}</p>
            </div>
        `;

        modalOverlay.classList.add('open');
        modalOverlay.setAttribute('aria-hidden', 'false');
    }

    function closeModal() {
        modalOverlay.classList.remove('open');
        modalOverlay.setAttribute('aria-hidden', 'true');
    }

    inspectBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            const projectKey = btn.getAttribute('data-project');
            openModal(projectKey);
        });
    });

    modalClose.addEventListener('click', closeModal);

    modalOverlay.addEventListener('click', (e) => {
        if (e.target === modalOverlay) closeModal();
    });

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && modalOverlay.classList.contains('open')) closeModal();
    });
}

/* --- Scroll Reveal Animations --- */
function initScrollReveal() {
    const revealElements = document.querySelectorAll('.reveal');

    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver((entries, obs) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('active');
                    obs.unobserve(entry.target);
                }
            });
        }, {
            threshold: 0.15,
            rootMargin: '0px 0px -40px 0px'
        });

        revealElements.forEach(el => observer.observe(el));
    } else {
        revealElements.forEach(el => el.classList.add('active'));
    }
}

/* --- Mobile Navigation Drawer --- */
function initMobileNav() {
    const menuToggle = document.getElementById('menuToggle');
    const navMenu = document.getElementById('primaryNav');

    if (!menuToggle || !navMenu) return;

    menuToggle.addEventListener('click', () => {
        const isOpen = navMenu.classList.toggle('open');
        menuToggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });

    const navLinks = navMenu.querySelectorAll('a');
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            navMenu.classList.remove('open');
            menuToggle.setAttribute('aria-expanded', 'false');
        });
    });
}

/* --- Contact System & Copy Clipboard --- */
function initContactSystem() {
    const contactForm = document.getElementById('contactForm');
    const formFeedback = document.getElementById('formFeedback');
    const copyBtns = document.querySelectorAll('.copy-btn');

    if (copyBtns.length) {
        copyBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const textToCopy = btn.getAttribute('data-copy');
                if (navigator.clipboard) {
                    navigator.clipboard.writeText(textToCopy).then(() => {
                        const originalHTML = btn.innerHTML;
                        btn.innerHTML = `<span style="font-size:0.75rem; font-weight:600;">Copied!</span>`;
                        setTimeout(() => { btn.innerHTML = originalHTML; }, 1800);
                    });
                }
            });
        });
    }

    if (contactForm && formFeedback) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const submitBtn = contactForm.querySelector('#submitBtn');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<span>Sending...</span>';
            }

            setTimeout(() => {
                formFeedback.className = 'form-feedback success';
                formFeedback.textContent = 'Thank you! Your message has been sent successfully. Arjav will respond shortly.';
                contactForm.reset();

                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = '<span>Send Message</span>';
                }
            }, 800);
        });
    }
}

/* --- 3D Perspective Card Tilt Effect --- */
function initCardTiltEffect() {
    const cards = document.querySelectorAll('.glow-card');

    cards.forEach(card => {
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;

            const rotateX = ((y - centerY) / centerY) * -4;
            const rotateY = ((x - centerX) / centerX) * 4;

            card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-4px)`;
        });

        card.addEventListener('mouseleave', () => {
            card.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) translateY(0px)';
        });
    });
}
/* --- Pixel-Block "Ask About Arjav" Chat Widget ---
   A small, self-contained FAQ bot: no external API calls, just keyword
   matching against a fixed set of answers grounded in the page's actual
   content (education, skills, projects, contact). Also handles opening,
   closing, the inviting bubble, and free dragging around the viewport. */
function initMinecraftChatWidget() {
    const widget = document.getElementById('mcChatWidget');
    const toggleBtn = document.getElementById('mcToggleBtn');
    const panel = document.getElementById('mcChatPanel');
    const closeBtn = document.getElementById('mcChatClose');
    const log = document.getElementById('mcChatLog');
    const form = document.getElementById('mcChatForm');
    const input = document.getElementById('mcChatInput');
    const inviteBubble = document.getElementById('mcInviteBubble');
    const header = document.getElementById('mcChatHeader');
    if (!widget || !toggleBtn || !panel || !form || !input) return;

    /* --- Knowledge base: each entry is checked in order, first match wins --- */
    const knowledgeBase = [
        {
            keywords: ['hello', 'hi', 'hey', 'yo', 'sup'],
            reply: "Hey! I'm a little block-bot here to answer questions about Arjav. Try asking about his skills, projects, education, or how to reach him!"
        },
        {
            keywords: ['who', 'about you', 'yourself'],
            reply: "Arjav Lal Joshi is a BSc (Hons) Computing with AI undergraduate at Islington College, Kathmandu, focused on AI/ML, embedded systems, and MicroPython development."
        },
        {
            keywords: ['skill', 'good at', 'expert', 'know how', 'stack', 'language'],
            reply: "His core stack: Python, MicroPython, Java, C, HTML5/CSS3, plus ESP32 hardware work (sensors, servos, I2C). Scroll to the Skills section for the full breakdown with proficiency bars."
        },
        {
            keywords: ['project', 'built', 'build', 'portfolio', 'work', 'parking', 'esp32', 'iot'],
            reply: "Three highlights: a Smart Parking System on ESP32 + MicroPython, an AI Model Subscription Manager built in Java Swing, and a Medicine Management CLI in Python. Check the Projects section — click \"Inspect\" on any card for full specs."
        },
        {
            keywords: ['education', 'school', 'college', 'gpa', 'study', 'university', 'degree'],
            reply: "Currently pursuing a BSc (Hons) in Computing with AI at Islington College (expected 2028). Prior: NEB +2 Science with a 3.88/4.00 GPA at GEMS School, Kathmandu."
        },
        {
            keywords: ['contact', 'email', 'reach', 'hire', 'phone', 'connect', 'available'],
            reply: "Best way to reach him is by email: arjav.joshi100@gmail.com — or just use the contact form at the bottom of the page. He's open to internships and AI/hardware collaborations."
        },
        {
            keywords: ['ai', 'machine learning', 'ml', 'artificial intelligence'],
            reply: "AI & ML is his main focus academically and in personal projects — he's especially interested in where it intersects with embedded hardware."
        },
        {
            keywords: ['thank', 'thanks', 'cool', 'nice', 'awesome'],
            reply: "Glad it helped! Feel free to ask about anything else — skills, projects, education, or contact info."
        }
    ];

    const fallbackReply = "Hmm, I haven't mined that information yet! Try asking about Arjav's skills, projects, education, or how to contact him.";

    function findReply(text) {
        const lower = text.toLowerCase();
        const match = knowledgeBase.find(entry => entry.keywords.some(k => lower.includes(k)));
        return match ? match.reply : fallbackReply;
    }

    function appendMessage(text, sender) {
        const msg = document.createElement('div');
        msg.className = sender === 'user' ? 'mc-msg mc-msg-user' : 'mc-msg mc-msg-bot';
        msg.textContent = text;
        log.appendChild(msg);
        log.scrollTop = log.scrollHeight;
    }

    function showTypingThenReply(text) {
        const typing = document.createElement('div');
        typing.className = 'mc-msg-typing';
        typing.textContent = '...';
        log.appendChild(typing);
        log.scrollTop = log.scrollHeight;

        const delay = 500 + Math.random() * 500;
        setTimeout(() => {
            typing.remove();
            appendMessage(text, 'bot');
        }, delay);
    }

    let greeted = false;

    function openChat() {
        widget.classList.add('open');
        toggleBtn.setAttribute('aria-expanded', 'true');
        panel.setAttribute('aria-hidden', 'false');
        inviteBubble.classList.remove('visible');
        if (!greeted) {
            greeted = true;
            showTypingThenReply("Hey there! Ask me anything about Arjav — his skills, projects, education, or how to get in touch.");
        }
        input.focus();
        playClickSound(700, 'square', 0.06);
    }

    function closeChat() {
        widget.classList.remove('open');
        toggleBtn.setAttribute('aria-expanded', 'false');
        panel.setAttribute('aria-hidden', 'true');
        playClickSound(400, 'square', 0.05);
    }

    toggleBtn.addEventListener('click', () => {
        widget.classList.contains('open') ? closeChat() : openChat();
    });

    closeBtn.addEventListener('click', closeChat);

    inviteBubble.addEventListener('click', openChat);
    inviteBubble.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' || e.key === ' ') openChat();
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const text = input.value.trim();
        if (!text) return;
        appendMessage(text, 'user');
        input.value = '';
        showTypingThenReply(findReply(text));
    });

    // Nudge the visitor with the invite bubble a few seconds after load,
    // as long as they haven't already opened the chat.
    setTimeout(() => {
        if (!widget.classList.contains('open')) {
            inviteBubble.classList.add('visible');
        }
    }, 4000);

    // Auto-hide the invite bubble again after a while so it doesn't nag.
    setTimeout(() => {
        inviteBubble.classList.remove('visible');
    }, 14000);

    /* --- Dragging: lets the widget be repositioned anywhere on screen ---
       Grabbing the header repositions the whole widget via fixed
       left/top coordinates, clamped so it can't be dragged off-screen. */
    let dragging = false;
    let dragOffsetX = 0;
    let dragOffsetY = 0;

    function startDrag(clientX, clientY) {
        const rect = widget.getBoundingClientRect();
        dragging = true;
        dragOffsetX = clientX - rect.left;
        dragOffsetY = clientY - rect.top;
        widget.style.right = 'auto';
        widget.style.bottom = 'auto';
        widget.style.left = `${rect.left}px`;
        widget.style.top = `${rect.top}px`;
    }

    function moveDrag(clientX, clientY) {
        if (!dragging) return;
        const widgetRect = widget.getBoundingClientRect();
        const maxLeft = window.innerWidth - widgetRect.width;
        const maxTop = window.innerHeight - widgetRect.height;
        const newLeft = Math.min(Math.max(0, clientX - dragOffsetX), Math.max(0, maxLeft));
        const newTop = Math.min(Math.max(0, clientY - dragOffsetY), Math.max(0, maxTop));
        widget.style.left = `${newLeft}px`;
        widget.style.top = `${newTop}px`;
    }

    function endDrag() {
        dragging = false;
    }

    if (header) {
        header.addEventListener('mousedown', (e) => {
            startDrag(e.clientX, e.clientY);
            e.preventDefault();
        });
    }

    window.addEventListener('mousemove', (e) => moveDrag(e.clientX, e.clientY));
    window.addEventListener('mouseup', endDrag);

    // Basic touch support so it can be repositioned on mobile too.
    if (header) {
        header.addEventListener('touchstart', (e) => {
            const t = e.touches[0];
            startDrag(t.clientX, t.clientY);
        }, { passive: true });
    }
    window.addEventListener('touchmove', (e) => {
        if (!dragging) return;
        const t = e.touches[0];
        moveDrag(t.clientX, t.clientY);
    }, { passive: true });
    window.addEventListener('touchend', endDrag);
}