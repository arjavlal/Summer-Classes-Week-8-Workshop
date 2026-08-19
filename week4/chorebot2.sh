<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="theme-color" content="#0A0A0F" />
<title>Tshering — Product Engineer</title>
<meta name="description" content="Portfolio of Tshering, a product engineer specializing in design systems, accessible interfaces, and end-to-end product craft." />
<link rel="icon" href="data:," />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,wght@0,300;0,400;0,500;0,600;0,700;0,900;1,400;1,500;1,600&family=IBM+Plex+Mono:wght@400;500;600&family=IBM+Plex+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          ink: '#0A0A0F',
          surface: '#141319',
          surface2: '#1C1B24',
          line: '#2A2934',
          violet: { DEFAULT: '#8464F0', soft: '#A78BFA' },
          spark: '#5EEAD4',
          paper: '#F3F1F7',
          mist: '#9A96AA'
        },
        fontFamily: {
          display: ['Fraunces', 'ui-serif', 'serif'],
          body: ['"IBM Plex Sans"', 'ui-sans-serif', 'sans-serif'],
          mono: ['"IBM Plex Mono"', 'ui-monospace', 'monospace']
        }
      }
    }
  }
</script>
<style>
  :root {
    --ink: #0A0A0F;
    --surface: #141319;
    --surface-2: #1C1B24;
    --line: #2A2934;
    --violet: #8464F0;
    --violet-soft: #A78BFA;
    --spark: #5EEAD4;
    --paper: #F3F1F7;
    --mist: #9A96AA;
  }

  html { scroll-behavior: smooth; scroll-padding-top: 6.5rem; }

  body { background: var(--ink); }

  ::selection { background: var(--violet); color: var(--ink); }

  ::-webkit-scrollbar { width: 10px; }
  ::-webkit-scrollbar-track { background: var(--ink); }
  ::-webkit-scrollbar-thumb { background: var(--line); border-radius: 9999px; }
  ::-webkit-scrollbar-thumb:hover { background: var(--violet); }

  :focus-visible { outline: 2px solid var(--spark); outline-offset: 3px; border-radius: 2px; }

  .skip-link {
    position: absolute; left: -9999px; top: 0; z-index: 100;
    background: var(--spark); color: var(--ink); font-weight: 600;
    padding: .75rem 1.25rem; border-radius: 0 0 .5rem 0;
  }
  .skip-link:focus { left: 0; }

  #siteHeader { border-bottom: 1px solid transparent; transition: border-color .3s ease, box-shadow .3s ease; }
  #siteHeader.scrolled { border-bottom-color: var(--line); box-shadow: 0 10px 30px -18px rgba(0,0,0,.8); }

  .brand { position: relative; }
  .nav-link { position: relative; padding: .25rem 0; color: var(--mist); transition: color .25s ease; }
  .nav-link::after {
    content: ''; position: absolute; left: 0; bottom: -2px; height: 1px; width: 0;
    background: linear-gradient(90deg, var(--violet), var(--spark)); transition: width .3s ease;
  }
  .nav-link:hover, .nav-link:focus-visible { color: var(--paper); }
  .nav-link:hover::after, .nav-link:focus-visible::after, .nav-link.is-active::after { width: 100%; }
  .nav-link.is-active { color: var(--paper); }

  #mobileMenu { opacity: 0; transform: translateY(-8px); transition: opacity .25s ease, transform .25s ease; }
  #mobileMenu.menu-open { opacity: 1; transform: translateY(0); }
  .mobile-nav-link { display: block; padding: .65rem 0; color: var(--mist); border-bottom: 1px solid var(--line); transition: color .2s ease; }
  .mobile-nav-link:hover, .mobile-nav-link:focus-visible { color: var(--paper); }

  .btn-primary {
    display: inline-flex; align-items: center; justify-content: center; gap: .5rem;
    border-radius: 9999px; background: var(--violet); color: var(--ink); font-weight: 600;
    font-size: .9rem; padding: .85rem 1.75rem;
    box-shadow: 0 8px 30px -8px rgba(132,100,240,.55);
    transition: transform .3s ease, box-shadow .3s ease, background .3s ease;
  }
  .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 14px 40px -8px rgba(132,100,240,.75); background: var(--violet-soft); }

  .btn-secondary {
    display: inline-flex; align-items: center; justify-content: center; gap: .5rem;
    border-radius: 9999px; border: 1px solid var(--line); color: var(--paper); font-weight: 600;
    font-size: .9rem; padding: .8rem 1.7rem; transition: all .3s ease;
  }
  .btn-secondary:hover { border-color: var(--violet); color: var(--violet-soft); transform: translateY(-2px); }

  .btn-ghost {
    display: inline-flex; align-items: center; border-radius: 9999px; border: 1px solid var(--line);
    color: var(--paper); font-size: .8rem; font-weight: 500; padding: .55rem 1.15rem; transition: all .25s ease;
  }
  .btn-ghost:hover { border-color: var(--violet); color: var(--violet-soft); }

  .pill, .tag {
    display: inline-flex; align-items: center; border-radius: 9999px; border: 1px solid var(--line);
    padding: .35rem .85rem; font-family: 'IBM Plex Mono', monospace; font-size: .72rem; color: var(--mist);
    transition: all .25s ease;
  }
  .pill:hover, .tag:hover { border-color: var(--violet); color: var(--paper); }

  .card { background: var(--surface); border: 1px solid var(--line); border-radius: 1.25rem; transition: border-color .3s ease, transform .3s ease; }
  .card:hover { border-color: var(--violet); transform: translateY(-4px); }

  .project-card .frame { position: relative; overflow: hidden; border-radius: 1.25rem; border: 1px solid var(--line); transition: border-color .3s ease; }
  .project-card:hover .frame { border-color: var(--violet); }
  .project-card img { transition: transform .6s ease; }
  .project-card:hover img { transform: scale(1.06); }

  .rail-dot { box-shadow: 0 0 0 4px var(--ink), 0 0 14px rgba(132,100,240,.65); }

  .input-field {
    width: 100%; border-radius: .75rem; border: 1px solid var(--line); background: var(--surface);
    color: var(--paper); padding: .75rem 1rem; font-size: .95rem; transition: border-color .25s ease, box-shadow .25s ease;
  }
  .input-field:focus { outline: none; border-color: var(--violet); box-shadow: 0 0 0 3px rgba(132,100,240,.25); }
  .field-error { min-height: 1rem; font-size: .78rem; color: #F87171; margin-top: .35rem; }

  .social-link { display: inline-flex; align-items: center; gap: .65rem; color: var(--mist); font-size: .95rem; transition: color .25s ease, transform .25s ease; }
  .social-link:hover, .social-link:focus-visible { color: var(--spark); transform: translateX(3px); }

  .reveal { opacity: 0; transform: translateY(24px); transition: opacity .7s ease, transform .7s ease; }
  .reveal.is-visible { opacity: 1; transform: none; }

  #about { background: radial-gradient(60% 50% at 50% 0%, rgba(132,100,240,0.18), transparent 70%), var(--ink); }

  .topo-path { animation: drift 20s ease-in-out infinite; }
  .topo-path:nth-child(2) { animation-duration: 26s; animation-delay: -6s; }
  .topo-path:nth-child(3) { animation-duration: 32s; animation-delay: -12s; }
  .topo-path:nth-child(4) { animation-duration: 22s; animation-delay: -3s; }
  @keyframes drift { 0%, 100% { transform: translate(0,0); } 50% { transform: translate(8px,-10px); } }

  #backToTop { opacity: 0; pointer-events: none; transition: opacity .3s ease, border-color .3s ease, color .3s ease, transform .3s ease; }
  #backToTop.is-visible { opacity: 1; pointer-events: auto; }
  #backToTop:hover { border-color: var(--violet); color: var(--violet-soft); transform: translateY(-2px); }

  @media (prefers-reduced-motion: reduce) {
    html { scroll-behavior: auto; }
    .reveal { opacity: 1; transform: none; transition: none; }
    .topo-path { animation: none; }
    #topoWrap { transform: none !important; }
    * { animation-duration: .001ms !important; animation-iteration-count: 1 !important; transition-duration: .001ms !important; }
  }
</style>
</head>
<body class="bg-ink text-paper font-body antialiased">

<a href="#main" class="skip-link">Skip to main content</a>

<header id="siteHeader" class="fixed inset-x-0 top-0 z-50 bg-ink/70 backdrop-blur-md">
  <div class="mx-auto flex max-w-6xl items-center justify-between px-6 py-5 lg:px-8">
    <a href="#about" class="brand font-display text-xl tracking-tight text-paper transition-colors hover:text-violet-soft" aria-label="Tshering — scroll to top">
      Tshering
    </a>

    <nav aria-label="Primary" class="hidden md:block">
      <ul class="flex items-center gap-8 font-body text-sm">
        <li><a href="#about" class="nav-link" data-nav>About</a></li>
        <li><a href="#experience" class="nav-link" data-nav>Experience</a></li>
        <li><a href="#skills" class="nav-link" data-nav>Skills</a></li>
        <li><a href="#work" class="nav-link" data-nav>Work</a></li>
        <li><a href="#contact" class="nav-link" data-nav>Contact</a></li>
      </ul>
    </nav>

    <a href="#contact" class="btn-ghost hidden md:inline-flex" data-nav>Let's talk</a>

    <button type="button" id="menuToggle" class="md:hidden text-paper" aria-expanded="false" aria-controls="mobileMenu" aria-label="Open menu">
      <svg id="iconMenu" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
      <svg id="iconClose" xmlns="http://www.w3.org/2000/svg" class="hidden h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18"/></svg>
    </button>
  </div>

  <div id="mobileMenu" class="hidden md:hidden">
    <nav aria-label="Mobile" class="border-t border-line/70 bg-ink px-6 py-4">
      <ul class="text-sm">
        <li><a href="#about" class="mobile-nav-link" data-nav>About</a></li>
        <li><a href="#experience" class="mobile-nav-link" data-nav>Experience</a></li>
        <li><a href="#skills" class="mobile-nav-link" data-nav>Skills</a></li>
        <li><a href="#work" class="mobile-nav-link" data-nav>Work</a></li>
        <li><a href="#contact" class="mobile-nav-link" data-nav>Contact</a></li>
      </ul>
      <a href="#contact" class="btn-primary mt-4 w-full" data-nav>Let's talk</a>
    </nav>
  </div>
</header>

<main id="main">

  <!-- ABOUT / HERO -->
  <section id="about" aria-labelledby="hero-heading" class="relative overflow-hidden pb-28 pt-40 sm:pt-48">
    <div id="topoWrap" class="pointer-events-none absolute inset-0 -z-10" aria-hidden="true" style="transition: transform .3s ease-out;">
      <svg viewBox="0 0 1200 800" preserveAspectRatio="xMidYMid slice" class="h-full w-full opacity-60">
        <defs>
          <linearGradient id="topoGrad" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="rgb(132,100,240)" />
            <stop offset="100%" stop-color="rgb(94,234,212)" />
          </linearGradient>
        </defs>
        <path class="topo-path" d="M-60,260 C140,180 300,340 500,270 C700,200 860,320 1060,250 C1160,220 1240,260 1300,230" fill="none" stroke="url(#topoGrad)" stroke-width="1.4" opacity="0.45"/>
        <path class="topo-path" d="M-60,360 C160,300 320,430 520,370 C720,310 880,410 1080,350 C1180,320 1240,350 1320,330" fill="none" stroke="url(#topoGrad)" stroke-width="1.2" opacity="0.35"/>
        <path class="topo-path" d="M-60,150 C120,90 280,210 480,160 C680,110 820,200 1020,150 C1140,120 1220,150 1300,130" fill="none" stroke="url(#topoGrad)" stroke-width="1" opacity="0.3"/>
        <path class="topo-path" d="M-60,470 C160,420 340,540 540,480 C740,420 900,510 1100,460 C1200,435 1250,455 1320,440" fill="none" stroke="url(#topoGrad)" stroke-width="1.2" opacity="0.25"/>
      </svg>
    </div>

    <div class="mx-auto max-w-6xl px-6 lg:px-8">
      <p class="reveal font-mono text-xs uppercase tracking-[0.3em] text-spark">Product Engineer</p>
      <h1 id="hero-heading" class="reveal mt-4 font-display text-6xl font-semibold leading-[0.95] text-paper sm:text-7xl lg:text-8xl" style="transition-delay: 60ms;">
        Tshering
      </h1>
      <p class="reveal mt-6 max-w-xl font-display text-2xl italic text-violet-soft sm:text-3xl" style="transition-delay: 120ms;">
        Interfaces that hold up in production.
      </p>
      <p class="reveal mt-6 max-w-xl text-base leading-relaxed text-mist sm:text-lg" style="transition-delay: 180ms;">
        I'm a product engineer who moves fluidly between design systems and shipped code — turning ambiguous briefs into interfaces that are fast, accessible, and built to last. Lately I've been focused on developer tooling, motion, and the small interaction details that make software feel considered.
      </p>
      <div class="reveal mt-10 flex flex-wrap gap-4" style="transition-delay: 240ms;">
        <a href="#work" class="btn-primary" data-nav>View the work <span aria-hidden="true">→</span></a>
        <a href="#contact" class="btn-secondary" data-nav>Start a project</a>
      </div>
    </div>
  </section>

  <!-- EXPERIENCE -->
  <section id="experience" aria-labelledby="exp-heading" class="border-t border-line py-24 sm:py-28">
    <div class="mx-auto max-w-5xl px-6 lg:px-8">
      <header class="reveal mb-16 max-w-xl">
        <p class="font-mono text-xs uppercase tracking-[0.3em] text-spark">Where I've worked</p>
        <h2 id="exp-heading" class="mt-3 font-display text-4xl text-paper sm:text-5xl">Experience</h2>
      </header>

      <ol class="space-y-2">
        <li class="reveal flex gap-6">
          <div class="flex flex-col items-center">
            <span class="rail-dot mt-1.5 h-3 w-3 shrink-0 rounded-full bg-violet" aria-hidden="true"></span>
            <span class="mt-1 w-px flex-1 bg-gradient-to-b from-violet/70 to-spark/40" aria-hidden="true"></span>
          </div>
          <article class="flex-1 pb-14">
            <div class="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
              <h3 class="font-display text-xl text-paper">Senior Product Engineer · Northwind Systems</h3>
              <p class="font-mono text-xs text-mist">2023 — Present</p>
            </div>
            <ul class="mt-3 space-y-1.5 text-sm leading-relaxed text-mist">
              <li>Led the rebuild of the design-token pipeline and shared component library now used by 12 product teams.</li>
              <li>Cut recurring UI bugs by 40% and shortened new-feature build time from weeks to days.</li>
              <li>Mentored three engineers into senior roles and folded a lightweight accessibility review into every pull request.</li>
            </ul>
          </article>
        </li>

        <li class="reveal flex gap-6">
          <div class="flex flex-col items-center">
            <span class="rail-dot mt-1.5 h-3 w-3 shrink-0 rounded-full bg-violet" aria-hidden="true"></span>
            <span class="mt-1 w-px flex-1 bg-gradient-to-b from-violet/70 to-spark/40" aria-hidden="true"></span>
          </div>
          <article class="flex-1 pb-14">
            <div class="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
              <h3 class="font-display text-xl text-paper">Product Engineer · Fieldnote</h3>
              <p class="font-mono text-xs text-mist">2021 — 2023</p>
            </div>
            <ul class="mt-3 space-y-1.5 text-sm leading-relaxed text-mist">
              <li>Owned the mobile redesign end to end, from research through shipped code, growing weekly active users by 65% in the first two quarters.</li>
              <li>Partnered directly with clinicians to simplify a 40-field intake form into a guided six-step flow.</li>
            </ul>
          </article>
        </li>

        <li class="reveal flex gap-6">
          <div class="flex flex-col items-center">
            <span class="rail-dot mt-1.5 h-3 w-3 shrink-0 rounded-full bg-violet" aria-hidden="true"></span>
            <span class="mt-1 w-px flex-1 bg-gradient-to-b from-violet/70 to-spark/40" aria-hidden="true"></span>
          </div>
          <article class="flex-1 pb-14">
            <div class="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
              <h3 class="font-display text-xl text-paper">Frontend Engineer · Aperture Health</h3>
              <p class="font-mono text-xs text-mist">2019 — 2021</p>
            </div>
            <ul class="mt-3 space-y-1.5 text-sm leading-relaxed text-mist">
              <li>Built the analytics dashboard care teams use to track patient outcomes across 30+ clinics.</li>
              <li>Introduced a component-testing practice that became the team's default before every release.</li>
            </ul>
          </article>
        </li>

        <li class="reveal flex gap-6">
          <div class="flex flex-col items-center">
            <span class="rail-dot mt-1.5 h-3 w-3 shrink-0 rounded-full bg-violet" aria-hidden="true"></span>
          </div>
          <article class="flex-1">
            <div class="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
              <h3 class="font-display text-xl text-paper">UI Engineer · Loft &amp; Co. Studio</h3>
              <p class="font-mono text-xs text-mist">2017 — 2019</p>
            </div>
            <ul class="mt-3 space-y-1.5 text-sm leading-relaxed text-mist">
              <li>Shipped marketing sites and micro-interactions for a roster of early-stage startups.</li>
              <li>Learned the discipline of turning static comps into responsive, animated interfaces under tight timelines.</li>
            </ul>
          </article>
        </li>
      </ol>
    </div>
  </section>

  <!-- SKILLS -->
  <section id="skills" aria-labelledby="skills-heading" class="border-t border-line py-24 sm:py-28">
    <div class="mx-auto max-w-6xl px-6 lg:px-8">
      <header class="reveal mb-16 max-w-xl">
        <p class="font-mono text-xs uppercase tracking-[0.3em] text-spark">What I bring</p>
        <h2 id="skills-heading" class="mt-3 font-display text-4xl text-paper sm:text-5xl">Skills</h2>
      </header>

      <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        <article class="card reveal p-7">
          <h3 class="font-display text-lg text-paper">Languages &amp; Frameworks</h3>
          <ul class="mt-5 flex flex-wrap gap-2" role="list">
            <li class="pill">TypeScript</li>
            <li class="pill">JavaScript</li>
            <li class="pill">React</li>
            <li class="pill">Next.js</li>
            <li class="pill">Node.js</li>
            <li class="pill">GraphQL</li>
            <li class="pill">Tailwind CSS</li>
          </ul>
        </article>

        <article class="card reveal p-7" style="transition-delay: 80ms;">
          <h3 class="font-display text-lg text-paper">Design &amp; Systems</h3>
          <ul class="mt-5 flex flex-wrap gap-2" role="list">
            <li class="pill">Design Tokens</li>
            <li class="pill">Figma</li>
            <li class="pill">Motion Design</li>
            <li class="pill">Design Systems</li>
            <li class="pill">WCAG 2.2</li>
            <li class="pill">Prototyping</li>
          </ul>
        </article>

        <article class="card reveal p-7" style="transition-delay: 160ms;">
          <h3 class="font-display text-lg text-paper">Craft &amp; Practice</h3>
          <ul class="mt-5 flex flex-wrap gap-2" role="list">
            <li class="pill">Performance Tuning</li>
            <li class="pill">Component Architecture</li>
            <li class="pill">Cross-functional Facilitation</li>
            <li class="pill">Mentorship</li>
            <li class="pill">Technical Writing</li>
            <li class="pill">Code Review</li>
          </ul>
        </article>
      </div>
    </div>
  </section>

  <!-- WORK -->
  <section id="work" aria-labelledby="work-heading" class="border-t border-line py-24 sm:py-28">
    <div class="mx-auto max-w-6xl px-6 lg:px-8">
      <header class="reveal mb-16 flex flex-wrap items-end justify-between gap-6">
        <div class="max-w-xl">
          <p class="font-mono text-xs uppercase tracking-[0.3em] text-spark">Selected work</p>
          <h2 id="work-heading" class="mt-3 font-display text-4xl text-paper sm:text-5xl">Work</h2>
        </div>
        <p class="max-w-sm text-sm text-mist">A handful of products I've helped design, build, and ship end to end.</p>
      </header>

      <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">

        <article class="project-card reveal">
          <a href="#" class="block" aria-label="View the Continuum project">
            <div class="frame relative">
              <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 480 320'%3E%3Cdefs%3E%3CradialGradient id='g1' cx='28%25' cy='28%25' r='75%25'%3E%3Cstop offset='0%25' stop-color='rgb(132,100,240)' stop-opacity='0.85'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3CradialGradient id='g2' cx='78%25' cy='75%25' r='70%25'%3E%3Cstop offset='0%25' stop-color='rgb(94,234,212)' stop-opacity='0.7'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3C/defs%3E%3Crect width='480' height='320' fill='rgb(20,19,25)'/%3E%3Crect width='480' height='320' fill='url(%23g1)'/%3E%3Crect width='480' height='320' fill='url(%23g2)'/%3E%3Cg stroke='rgb(42,41,52)' stroke-width='1' opacity='0.6'%3E%3Cpath d='M0 107 H480'/%3E%3Cpath d='M0 213 H480'/%3E%3Cpath d='M160 0 V320'/%3E%3Cpath d='M320 0 V320'/%3E%3C/g%3E%3C/svg%3E" alt="Abstract violet and teal gradient artwork representing the Continuum design-token pipeline" class="h-56 w-full object-cover" />
              <div class="absolute inset-0 bg-gradient-to-t from-ink/95 via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-5">
                <h3 class="font-display text-xl text-paper">Continuum</h3>
                <p class="mt-1 text-sm text-mist">A token pipeline that keeps design and code in sync across 12 product teams.</p>
              </div>
            </div>
          </a>
          <ul class="mt-4 flex flex-wrap gap-2" aria-label="Technologies used on Continuum">
            <li class="tag">Design Systems</li>
            <li class="tag">TypeScript</li>
            <li class="tag">Figma API</li>
          </ul>
        </article>

        <article class="project-card reveal" style="transition-delay: 60ms;">
          <a href="#" class="block" aria-label="View the Fieldnote Mobile project">
            <div class="frame relative">
              <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 480 320'%3E%3Cdefs%3E%3CradialGradient id='g1' cx='72%25' cy='25%25' r='75%25'%3E%3Cstop offset='0%25' stop-color='rgb(196,120,255)' stop-opacity='0.8'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3CradialGradient id='g2' cx='25%25' cy='78%25' r='70%25'%3E%3Cstop offset='0%25' stop-color='rgb(99,140,255)' stop-opacity='0.7'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3C/defs%3E%3Crect width='480' height='320' fill='rgb(20,19,25)'/%3E%3Crect width='480' height='320' fill='url(%23g1)'/%3E%3Crect width='480' height='320' fill='url(%23g2)'/%3E%3Cg stroke='rgb(42,41,52)' stroke-width='1' opacity='0.6'%3E%3Cpath d='M0 107 H480'/%3E%3Cpath d='M0 213 H480'/%3E%3Cpath d='M160 0 V320'/%3E%3Cpath d='M320 0 V320'/%3E%3C/g%3E%3C/svg%3E" alt="Abstract orchid and blue gradient artwork representing the Fieldnote Mobile app redesign" class="h-56 w-full object-cover" />
              <div class="absolute inset-0 bg-gradient-to-t from-ink/95 via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-5">
                <h3 class="font-display text-xl text-paper">Fieldnote Mobile</h3>
                <p class="mt-1 text-sm text-mist">A ground-up redesign turning a 40-field intake form into a guided flow.</p>
              </div>
            </div>
          </a>
          <ul class="mt-4 flex flex-wrap gap-2" aria-label="Technologies used on Fieldnote Mobile">
            <li class="tag">React Native</li>
            <li class="tag">UX Research</li>
            <li class="tag">Accessibility</li>
          </ul>
        </article>

        <article class="project-card reveal" style="transition-delay: 120ms;">
          <a href="#" class="block" aria-label="View the Aperture Insights project">
            <div class="frame relative">
              <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 480 320'%3E%3Cdefs%3E%3CradialGradient id='g1' cx='50%25' cy='20%25' r='75%25'%3E%3Cstop offset='0%25' stop-color='rgb(94,234,212)' stop-opacity='0.8'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3CradialGradient id='g2' cx='50%25' cy='85%25' r='70%25'%3E%3Cstop offset='0%25' stop-color='rgb(99,102,241)' stop-opacity='0.7'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3C/defs%3E%3Crect width='480' height='320' fill='rgb(20,19,25)'/%3E%3Crect width='480' height='320' fill='url(%23g1)'/%3E%3Crect width='480' height='320' fill='url(%23g2)'/%3E%3Cg stroke='rgb(42,41,52)' stroke-width='1' opacity='0.6'%3E%3Cpath d='M0 107 H480'/%3E%3Cpath d='M0 213 H480'/%3E%3Cpath d='M160 0 V320'/%3E%3Cpath d='M320 0 V320'/%3E%3C/g%3E%3C/svg%3E" alt="Abstract teal and indigo gradient artwork representing the Aperture Insights analytics dashboard" class="h-56 w-full object-cover" />
              <div class="absolute inset-0 bg-gradient-to-t from-ink/95 via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-5">
                <h3 class="font-display text-xl text-paper">Aperture Insights</h3>
                <p class="mt-1 text-sm text-mist">A dashboard care teams use to track outcomes across 30+ clinics in real time.</p>
              </div>
            </div>
          </a>
          <ul class="mt-4 flex flex-wrap gap-2" aria-label="Technologies used on Aperture Insights">
            <li class="tag">React</li>
            <li class="tag">D3.js</li>
            <li class="tag">Data Viz</li>
          </ul>
        </article>

        <article class="project-card reveal">
          <a href="#" class="block" aria-label="View the Waypoint project">
            <div class="frame relative">
              <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 480 320'%3E%3Cdefs%3E%3CradialGradient id='g1' cx='20%25' cy='70%25' r='75%25'%3E%3Cstop offset='0%25' stop-color='rgb(132,100,240)' stop-opacity='0.85'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3CradialGradient id='g2' cx='80%25' cy='25%25' r='70%25'%3E%3Cstop offset='0%25' stop-color='rgb(217,70,239)' stop-opacity='0.6'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3C/defs%3E%3Crect width='480' height='320' fill='rgb(20,19,25)'/%3E%3Crect width='480' height='320' fill='url(%23g1)'/%3E%3Crect width='480' height='320' fill='url(%23g2)'/%3E%3Cg stroke='rgb(42,41,52)' stroke-width='1' opacity='0.6'%3E%3Cpath d='M0 107 H480'/%3E%3Cpath d='M0 213 H480'/%3E%3Cpath d='M160 0 V320'/%3E%3Cpath d='M320 0 V320'/%3E%3C/g%3E%3C/svg%3E" alt="Abstract violet and fuchsia gradient artwork representing the Waypoint component library" class="h-56 w-full object-cover" />
              <div class="absolute inset-0 bg-gradient-to-t from-ink/95 via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-5">
                <h3 class="font-display text-xl text-paper">Waypoint</h3>
                <p class="mt-1 text-sm text-mist">An open-source component library with accessibility checks built in.</p>
              </div>
            </div>
          </a>
          <ul class="mt-4 flex flex-wrap gap-2" aria-label="Technologies used on Waypoint">
            <li class="tag">Open Source</li>
            <li class="tag">React</li>
            <li class="tag">a11y</li>
          </ul>
        </article>

        <article class="project-card reveal" style="transition-delay: 60ms;">
          <a href="#" class="block" aria-label="View the Northwind Console project">
            <div class="frame relative">
              <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 480 320'%3E%3Cdefs%3E%3CradialGradient id='g1' cx='35%25' cy='65%25' r='75%25'%3E%3Cstop offset='0%25' stop-color='rgb(100,116,255)' stop-opacity='0.8'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3CradialGradient id='g2' cx='70%25' cy='30%25' r='70%25'%3E%3Cstop offset='0%25' stop-color='rgb(94,234,212)' stop-opacity='0.7'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3C/defs%3E%3Crect width='480' height='320' fill='rgb(20,19,25)'/%3E%3Crect width='480' height='320' fill='url(%23g1)'/%3E%3Crect width='480' height='320' fill='url(%23g2)'/%3E%3Cg stroke='rgb(42,41,52)' stroke-width='1' opacity='0.6'%3E%3Cpath d='M0 107 H480'/%3E%3Cpath d='M0 213 H480'/%3E%3Cpath d='M160 0 V320'/%3E%3Cpath d='M320 0 V320'/%3E%3C/g%3E%3C/svg%3E" alt="Abstract blue and teal gradient artwork representing the Northwind Console developer tool" class="h-56 w-full object-cover" />
              <div class="absolute inset-0 bg-gradient-to-t from-ink/95 via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-5">
                <h3 class="font-display text-xl text-paper">Northwind Console</h3>
                <p class="mt-1 text-sm text-mist">An internal tool that turned a 9-step deploy process into one guided flow.</p>
              </div>
            </div>
          </a>
          <ul class="mt-4 flex flex-wrap gap-2" aria-label="Technologies used on Northwind Console">
            <li class="tag">Next.js</li>
            <li class="tag">DX Tooling</li>
            <li class="tag">Node.js</li>
          </ul>
        </article>

        <article class="project-card reveal" style="transition-delay: 120ms;">
          <a href="#" class="block" aria-label="View the Glass project">
            <div class="frame relative">
              <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 480 320'%3E%3Cdefs%3E%3CradialGradient id='g1' cx='60%25' cy='40%25' r='75%25'%3E%3Cstop offset='0%25' stop-color='rgb(167,139,250)' stop-opacity='0.8'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3CradialGradient id='g2' cx='30%25' cy='75%25' r='70%25'%3E%3Cstop offset='0%25' stop-color='rgb(45,212,191)' stop-opacity='0.7'/%3E%3Cstop offset='100%25' stop-color='rgb(20,19,25)' stop-opacity='0'/%3E%3C/radialGradient%3E%3C/defs%3E%3Crect width='480' height='320' fill='rgb(20,19,25)'/%3E%3Crect width='480' height='320' fill='url(%23g1)'/%3E%3Crect width='480' height='320' fill='url(%23g2)'/%3E%3Cg stroke='rgb(42,41,52)' stroke-width='1' opacity='0.6'%3E%3Cpath d='M0 107 H480'/%3E%3Cpath d='M0 213 H480'/%3E%3Cpath d='M160 0 V320'/%3E%3Cpath d='M320 0 V320'/%3E%3C/g%3E%3C/svg%3E" alt="Abstract lavender and teal gradient artwork representing the Glass generative art project" class="h-56 w-full object-cover" />
              <div class="absolute inset-0 bg-gradient-to-t from-ink/95 via-ink/20 to-transparent"></div>
              <div class="absolute inset-x-0 bottom-0 p-5">
                <h3 class="font-display text-xl text-paper">Glass</h3>
                <p class="mt-1 text-sm text-mist">A small generative-art side project exploring light, gradient, and motion.</p>
              </div>
            </div>
          </a>
          <ul class="mt-4 flex flex-wrap gap-2" aria-label="Technologies used on Glass">
            <li class="tag">Canvas API</li>
            <li class="tag">Motion</li>
            <li class="tag">Side Project</li>
          </ul>
        </article>

      </div>
    </div>
  </section>

  <!-- CONTACT -->
  <section id="contact" aria-labelledby="contact-heading" class="border-t border-line py-24 sm:py-28">
    <div class="mx-auto max-w-6xl px-6 lg:px-8">
      <div class="grid gap-16 lg:grid-cols-[1.1fr_0.9fr]">
        <div class="reveal">
          <p class="font-mono text-xs uppercase tracking-[0.3em] text-spark">Get in touch</p>
          <h2 id="contact-heading" class="mt-3 font-display text-4xl text-paper sm:text-5xl">Contact</h2>
          <p class="mt-6 max-w-md text-mist">Have a project, a role, or just a good problem to think through? I read every message and usually reply within a couple of days. All fields are required.</p>

          <form id="contactForm" novalidate class="mt-10 space-y-6">
            <div>
              <label for="name" class="block text-sm font-medium text-paper">Name</label>
              <input type="text" id="name" name="name" required autocomplete="name" class="input-field mt-2" />
              <p class="field-error" id="nameError" role="alert"></p>
            </div>
            <div>
              <label for="email" class="block text-sm font-medium text-paper">Email</label>
              <input type="email" id="email" name="email" required autocomplete="email" class="input-field mt-2" />
              <p class="field-error" id="emailError" role="alert"></p>
            </div>
            <div>
              <label for="message" class="block text-sm font-medium text-paper">Message</label>
              <textarea id="message" name="message" rows="5" required class="input-field mt-2"></textarea>
              <p class="field-error" id="messageError" role="alert"></p>
            </div>
            <button type="submit" class="btn-primary w-full sm:w-auto">Send message</button>
            <p id="formStatus" class="text-sm text-spark" aria-live="polite"></p>
          </form>
        </div>

        <aside aria-labelledby="connect-heading" class="reveal lg:pl-6" style="transition-delay: 100ms;">
          <h3 id="connect-heading" class="font-display text-xl text-paper">Find me elsewhere</h3>
          <ul class="mt-6 space-y-4" role="list">
            <li>
              <a href="mailto:hello@tshering.dev" class="social-link">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" aria-hidden="true"><path d="M3 6h18v12H3z"/><path d="M3 6l9 7 9-7"/></svg>
                hello@tshering.dev
              </a>
            </li>
            <li>
              <a href="#" class="social-link">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" aria-hidden="true"><circle cx="12" cy="8" r="3"/><path d="M6 9c-2 1.5-2 5-2 5M18 9c2 1.5 2 5 2 5"/></svg>
                GitHub
              </a>
            </li>
            <li>
              <a href="#" class="social-link">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" aria-hidden="true"><circle cx="8" cy="8" r="3.2"/><circle cx="16" cy="16" r="3.2"/><path d="M10.3 9.7L13.7 14.3"/></svg>
                LinkedIn
              </a>
            </li>
            <li>
              <a href="#" class="social-link">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" aria-hidden="true"><path d="M5 5l14 14M19 5L5 19"/></svg>
                X / Twitter
              </a>
            </li>
          </ul>

          <div class="mt-10 rounded-2xl border border-line bg-surface p-6">
            <p class="font-mono text-xs uppercase tracking-widest text-spark">Currently</p>
            <p class="mt-2 text-sm text-mist">Based in Kathmandu (GMT+5:45), open to remote product engineering roles and select freelance work.</p>
          </div>
        </aside>
      </div>
    </div>
  </section>

</main>

<footer class="border-t border-line py-12">
  <div class="mx-auto flex max-w-6xl flex-col items-center gap-4 px-6 text-center lg:px-8">
    <a href="#about" class="font-display text-lg text-paper transition-colors hover:text-violet-soft" data-nav>Tshering</a>
    <p class="font-body text-sm text-mist">© 2026 Tshering. All rights reserved.</p>
    <a href="#about" class="font-mono text-xs text-mist transition-colors hover:text-spark" data-nav>Back to top ↑</a>
  </div>
</footer>

<button type="button" id="backToTop" aria-label="Back to top" class="fixed bottom-6 right-6 z-40 flex h-11 w-11 items-center justify-center rounded-full border border-line bg-surface/80 text-paper backdrop-blur">
  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 19V5M5 12l7-7 7 7"/></svg>
</button>

<script>
  (function () {
    var prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    /* Header scroll state */
    var header = document.getElementById('siteHeader');
    function onScrollHeader() {
      header.classList.toggle('scrolled', window.scrollY > 12);
    }
    window.addEventListener('scroll', onScrollHeader, { passive: true });
    onScrollHeader();

    /* Mobile menu */
    var menuToggle = document.getElementById('menuToggle');
    var mobileMenu = document.getElementById('mobileMenu');
    var iconMenu = document.getElementById('iconMenu');
    var iconClose = document.getElementById('iconClose');
    var closeTimer = null;

    function openMenu() {
      window.clearTimeout(closeTimer);
      mobileMenu.classList.remove('hidden');
      requestAnimationFrame(function () { mobileMenu.classList.add('menu-open'); });
      menuToggle.setAttribute('aria-expanded', 'true');
      menuToggle.setAttribute('aria-label', 'Close menu');
      iconMenu.classList.add('hidden');
      iconClose.classList.remove('hidden');
    }
    function closeMenu() {
      if (mobileMenu.classList.contains('hidden')) return;
      mobileMenu.classList.remove('menu-open');
      menuToggle.setAttribute('aria-expanded', 'false');
      menuToggle.setAttribute('aria-label', 'Open menu');
      iconMenu.classList.remove('hidden');
      iconClose.classList.add('hidden');
      closeTimer = window.setTimeout(function () { mobileMenu.classList.add('hidden'); }, 250);
    }
    menuToggle.addEventListener('click', function () {
      var isOpen = menuToggle.getAttribute('aria-expanded') === 'true';
      isOpen ? closeMenu() : openMenu();
    });
    document.querySelectorAll('[data-nav]').forEach(function (link) {
      link.addEventListener('click', closeMenu);
    });
    window.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') closeMenu();
    });
    window.addEventListener('resize', function () {
      if (window.innerWidth >= 768) closeMenu();
    });

    /* Scrollspy */
    var sections = document.querySelectorAll('main section[id]');
    var navLinks = document.querySelectorAll('[data-nav]');
    var spy = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        var id = entry.target.id;
        navLinks.forEach(function (link) {
          var match = link.getAttribute('href') === ('#' + id);
          link.classList.toggle('is-active', match);
          if (match) { link.setAttribute('aria-current', 'true'); } else { link.removeAttribute('aria-current'); }
        });
      });
    }, { rootMargin: '-45% 0px -50% 0px', threshold: 0 });
    sections.forEach(function (s) { spy.observe(s); });

    /* Reveal on scroll */
    var revealEls = document.querySelectorAll('.reveal');
    if (prefersReduced) {
      revealEls.forEach(function (el) { el.classList.add('is-visible'); });
    } else {
      var revealObserver = new IntersectionObserver(function (entries, obs) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            obs.unobserve(entry.target);
          }
        });
      }, { threshold: 0.15 });
      revealEls.forEach(function (el) { revealObserver.observe(el); });
    }

    /* Hero parallax */
    var topoWrap = document.getElementById('topoWrap');
    var heroSection = document.getElementById('about');
    if (topoWrap && heroSection && !prefersReduced) {
      var ticking = false;
      heroSection.addEventListener('mousemove', function (e) {
        if (ticking) return;
        ticking = true;
        requestAnimationFrame(function () {
          var rect = heroSection.getBoundingClientRect();
          var relX = (e.clientX - rect.left) / rect.width - 0.5;
          var relY = (e.clientY - rect.top) / rect.height - 0.5;
          topoWrap.style.transform = 'translate(' + (relX * -16) + 'px,' + (relY * -12) + 'px)';
          ticking = false;
        });
      });
      heroSection.addEventListener('mouseleave', function () {
        topoWrap.style.transform = 'translate(0,0)';
      });
    }

    /* Back to top */
    var backToTop = document.getElementById('backToTop');
    function onScrollBackToTop() {
      backToTop.classList.toggle('is-visible', window.scrollY > 500);
    }
    window.addEventListener('scroll', onScrollBackToTop, { passive: true });
    backToTop.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: prefersReduced ? 'auto' : 'smooth' });
    });
    onScrollBackToTop();

    /* Contact form validation */
    var form = document.getElementById('contactForm');
    var status = document.getElementById('formStatus');
    var nameField = document.getElementById('name');
    var emailField = document.getElementById('email');
    var messageField = document.getElementById('message');
    var nameError = document.getElementById('nameError');
    var emailError = document.getElementById('emailError');
    var messageError = document.getElementById('messageError');
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var valid = true;
      nameError.textContent = '';
      emailError.textContent = '';
      messageError.textContent = '';
      status.textContent = '';

      if (!nameField.value.trim()) {
        nameError.textContent = 'Please enter your name.';
        valid = false;
      }
      if (!emailPattern.test(emailField.value.trim())) {
        emailError.textContent = 'Please enter a valid email address.';
        valid = false;
      }
      if (messageField.value.trim().length < 10) {
        messageError.textContent = 'Say a little more — at least 10 characters.';
        valid = false;
      }
      if (!valid) return;

      var firstName = nameField.value.trim().split(' ')[0];
      status.textContent = 'Thanks, ' + firstName + ' — I\'ve got your message and will reply soon.';
      form.reset();
    });
  })();
</script>

</body>
</html>