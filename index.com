<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Akbaraliyev Abdulloh — Robotics & Web Developer</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root{
    --ink: #EDEFF5;
    --ink-dim: #9AA3B8;
    --ink-faint: #5C6478;
    --bg: #12151C;
    --bg-raised: #191D27;
    --bg-card: #1D2230;
    --accent: #E8A33D;
    --accent-dim: rgba(232,163,61,0.14);
    --line: #2A2F3E;
    --green: #6FBF8B;
    --mono: 'JetBrains Mono', monospace;
    --sans: 'Inter', sans-serif;
  }
  *{box-sizing:border-box; margin:0; padding:0;}
  html{scroll-behavior:smooth;}
  body{
    background:var(--bg);
    color:var(--ink);
    font-family:var(--sans);
    line-height:1.6;
    -webkit-font-smoothing:antialiased;
  }
  ::selection{ background:var(--accent); color:#12151C; }
  a{color:inherit; text-decoration:none;}

  .wrap{ max-width:840px; margin:0 auto; padding:0 24px; }

  /* NAV */
  nav{
    position:sticky; top:0; z-index:50;
    background:rgba(18,21,28,0.85); backdrop-filter:blur(8px);
    border-bottom:1px solid var(--line);
  }
  nav .wrap{ display:flex; align-items:center; justify-content:space-between; height:64px; }
  .logo{ font-family:var(--mono); font-weight:700; font-size:15px; color:var(--ink); }
  .logo span{ color:var(--accent); }
  .navlinks{ display:flex; gap:28px; font-family:var(--mono); font-size:13px; color:var(--ink-dim); }
  .navlinks a:hover{ color:var(--accent); }
  @media (max-width:600px){ .navlinks{ gap:16px; font-size:12px; } }

  /* HERO / TERMINAL */
  .hero{ padding:88px 0 64px; }
  .terminal{
    background:var(--bg-raised);
    border:1px solid var(--line);
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 20px 60px -20px rgba(0,0,0,0.6);
  }
  .term-bar{
    display:flex; align-items:center; gap:8px;
    padding:12px 16px; background:var(--bg-card);
    border-bottom:1px solid var(--line);
  }
  .dot{ width:11px; height:11px; border-radius:50%; }
  .dot.r{ background:#FF5F57; } .dot.y{ background:#FEBC2E; } .dot.g{ background:#28C840; }
  .term-title{ margin-left:8px; font-family:var(--mono); font-size:12px; color:var(--ink-faint); }
  .term-body{ padding:24px; font-family:var(--mono); font-size:14px; }
  .term-body .line{ margin-bottom:6px; color:var(--ink-dim); }
  .prompt{ color:var(--green); }
  .path{ color:var(--accent); }
  .whoami-row{ display:flex; align-items:center; gap:20px; margin-top:14px; flex-wrap:wrap; }
  .avatar{
    width:84px; height:84px; border-radius:50%; object-fit:cover;
    border:2px solid var(--accent); flex-shrink:0;
    box-shadow:0 0 0 4px var(--accent-dim);
  }
  .out-name{ font-size:26px; font-weight:700; color:var(--ink); margin:0 0 4px; }
  .out-role{ color:var(--accent); font-weight:500; }
  .out-desc{ color:var(--ink-dim); margin-top:10px; font-family:var(--sans); font-size:15px; max-width:520px; }
  .cursor{ display:inline-block; width:8px; height:16px; background:var(--accent); vertical-align:middle; animation:blink 1s step-end infinite; }
  @keyframes blink{ 50%{ opacity:0; } }
  @media (prefers-reduced-motion: reduce){ .cursor{ animation:none; } }

  .hero-links{ display:flex; gap:14px; margin-top:22px; flex-wrap:wrap; }
  .btn{
    font-family:var(--mono); font-size:13px; padding:10px 18px;
    border-radius:6px; border:1px solid var(--line);
  }
  .btn.primary{ background:var(--accent); color:#12151C; font-weight:700; border-color:var(--accent); }
  .btn.primary:hover{ opacity:0.9; }
  .btn.ghost{ color:var(--ink); }
  .btn.ghost:hover{ border-color:var(--accent); color:var(--accent); }

  /* SECTION HEADER — semver style */
  .section{ padding:56px 0; border-top:1px solid var(--line); }
  .ver-tag{
    display:inline-flex; align-items:center; gap:8px;
    font-family:var(--mono); font-size:12px; color:var(--accent);
    background:var(--accent-dim); padding:4px 10px; border-radius:20px;
    margin-bottom:14px;
  }
  .sec-title{ font-size:24px; font-weight:700; color:var(--ink); margin-bottom:6px; }
  .sec-sub{ color:var(--ink-faint); font-size:14px; margin-bottom:32px; font-family:var(--mono); }

  /* SKILLS */
  .skill-grid{ display:grid; grid-template-columns:repeat(auto-fill,minmax(190px,1fr)); gap:14px; }
  .skill-card{
    background:var(--bg-card); border:1px solid var(--line); border-radius:8px;
    padding:16px; transition:border-color .2s, transform .2s;
  }
  .skill-card:hover{ border-color:var(--accent); transform:translateY(-2px); }
  .skill-cat{ font-family:var(--mono); font-size:11px; color:var(--accent); letter-spacing:0.06em; text-transform:uppercase; margin-bottom:8px; }
  .skill-list{ font-size:13.5px; color:var(--ink-dim); }

  /* PROJECTS as repo cards */
  .repo{
    display:block; background:var(--bg-card); border:1px solid var(--line);
    border-radius:8px; padding:20px; margin-bottom:14px;
    transition:border-color .2s, transform .2s;
  }
  .repo:hover{ border-color:var(--accent); transform:translateX(3px); }
  .repo-head{ display:flex; align-items:center; justify-content:space-between; margin-bottom:8px; flex-wrap:wrap; gap:8px; }
  .repo-name{ font-family:var(--mono); font-weight:700; font-size:16px; color:var(--ink); }
  .repo-name .slash{ color:var(--ink-faint); font-weight:400; }
  .repo-tag{ font-family:var(--mono); font-size:11px; color:var(--green); border:1px solid var(--green); padding:2px 8px; border-radius:20px; }
  .repo-desc{ color:var(--ink-dim); font-size:14px; margin-bottom:12px; }
  .repo-meta{ display:flex; gap:18px; font-family:var(--mono); font-size:12px; color:var(--ink-faint); flex-wrap:wrap; }
  .repo-meta span{ display:flex; align-items:center; gap:5px; }
  .dotcolor{ width:8px; height:8px; border-radius:50%; background:var(--accent); display:inline-block; }

  /* CHANGELOG / EXPERIENCE */
  .log-entry{ display:flex; gap:20px; padding-bottom:28px; position:relative; }
  .log-entry:not(:last-child)::before{
    content:''; position:absolute; left:5px; top:22px; bottom:0; width:1px; background:var(--line);
  }
  .log-dot{ width:11px; height:11px; border-radius:50%; background:var(--bg); border:2px solid var(--accent); flex-shrink:0; margin-top:4px; }
  .log-ver{ font-family:var(--mono); color:var(--accent); font-size:13px; font-weight:700; }
  .log-role{ font-weight:600; color:var(--ink); margin:2px 0 4px; }
  .log-date{ font-family:var(--mono); font-size:12px; color:var(--ink-faint); margin-bottom:8px; display:block; }
  .log-desc{ color:var(--ink-dim); font-size:14px; }

  /* CONTACT */
  .contact-term{ font-family:var(--mono); font-size:14px; }
  .contact-list{ margin-top:16px; display:flex; flex-direction:column; gap:10px; }
  .contact-list a{ color:var(--ink-dim); display:flex; align-items:center; gap:10px; font-size:14px; }
  .contact-list a:hover{ color:var(--accent); }
  .contact-list .k{ color:var(--accent); font-family:var(--mono); font-size:13px; width:80px; flex-shrink:0; }

  footer{ padding:32px 0; text-align:center; font-family:var(--mono); font-size:12px; color:var(--ink-faint); border-top:1px solid var(--line); }

  .reveal{ opacity:0; transform:translateY(16px); transition:opacity .6s ease, transform .6s ease; }
  .reveal.show{ opacity:1; transform:none; }
  @media (prefers-reduced-motion: reduce){ .reveal{ opacity:1; transform:none; transition:none; } }
</style>
</head>
<body>

<nav>
  <div class="wrap">
    <div class="logo">~/<span>portfolio</span></div>
    <div class="navlinks">
      <a href="#skills">skills</a>
      <a href="#projects">projects</a>
      <a href="#experience">log</a>
      <a href="#contact">contact</a>
    </div>
  </div>
</nav>

<header class="hero">
  <div class="wrap">
    <div class="terminal">
      <div class="term-bar">
        <div class="dot r"></div><div class="dot y"></div><div class="dot g"></div>
        <div class="term-title">bash — whoami</div>
      </div>
      <div class="term-body">
        <div class="line"><span class="prompt">guest@robot</span>:<span class="path">~</span>$ whoami</div>
        <div class="whoami-row">
          <img class="avatar" src="data:image/jpeg;base64,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" alt="Akbaraliyev Abdulloh">
          <div>
            <div class="out-name">Akbaraliyev Abdulloh</div>
            <div class="out-role">// Robotics Developer | Arduino Developer | Beginner Web Developer</div>
          </div>
        </div>
        <div class="out-desc">Robototexnika va dasturlashga qiziqadigan o'quvchiman. Arduino asosida turli robotlar yarataman va HTML, CSS hamda JavaScript yordamida oddiy veb-saytlar ishlab chiqaman. Doim yangi texnologiyalarni o'rganish va musobaqalarda qatnashish orqali tajribamni oshirib boraman.</div>
        <div class="line" style="margin-top:14px;"><span class="prompt">guest@web</span>:<span class="path">~</span>$ <span class="cursor"></span></div>
      </div>
    </div>
  </div>
</header>

<section class="section reveal" id="skills">
  <div class="wrap">
    <div class="ver-tag">v1.0.0</div>
    <div class="sec-title">Ko'nikmalar</div>
    <div class="sec-sub">// stack.json</div>
    <div class="skill-grid">
      <div class="skill-card">
        <div class="skill-cat">Robototexnika</div>
        <div class="skill-list">Arduino (C/C++), Line Follower, Robo Sumo, Robo Football</div>
      </div>
      <div class="skill-card">
        <div class="skill-cat">Dizayn</div>
        <div class="skill-list">Onshape (3D dizayn)</div>
      </div>
      <div class="skill-card">
        <div class="skill-cat">Web</div>
        <div class="skill-list">HTML, CSS, JavaScript (boshlang'ich)</div>
      </div>
      <div class="skill-card">
        <div class="skill-cat">Vositalar</div>
        <div class="skill-list">Git & GitHub</div>
      </div>
    </div>
  </div>
</section>

<section class="section reveal" id="projects">
  <div class="wrap">
    <div class="ver-tag">v2.0.0</div>
    <div class="sec-title">Loyihalar</div>
    <div class="sec-sub">// build-log</div>

    <a class="repo" href="#">
      <div class="repo-head">
        <div class="repo-name">abdulloh <span class="slash">/</span> robo-football-robot</div>
        <div class="repo-tag">musobaqa</div>
      </div>
      <div class="repo-desc">Robo Football musobaqalari uchun yaratilgan robot.</div>
      <div class="repo-meta">
        <span><span class="dotcolor"></span> Arduino Uno, L298N, DC motorlar</span>
      </div>
    </a>

    <a class="repo" href="#">
      <div class="repo-head">
        <div class="repo-name">abdulloh <span class="slash">/</span> line-follower-robot</div>
        <div class="repo-tag">musobaqa</div>
      </div>
      <div class="repo-desc">Qora chiziq bo'ylab avtomatik harakatlanadigan robot.</div>
      <div class="repo-meta">
        <span><span class="dotcolor"></span> Arduino Uno, IR Sensor, L298N, C++</span>
      </div>
    </a>

    <a class="repo" href="#">
      <div class="repo-head">
        <div class="repo-name">abdulloh <span class="slash">/</span> robo-sumo-robot</div>
        <div class="repo-tag">musobaqa</div>
      </div>
      <div class="repo-desc">Sumo musobaqalari uchun yaratilgan robot.</div>
      <div class="repo-meta">
        <span><span class="dotcolor"></span> Arduino Nano, Ultrasonic Sensor, L298N</span>
      </div>
    </a>

    <a class="repo" href="#">
      <div class="repo-head">
        <div class="repo-name">abdulloh <span class="slash">/</span> robot-portfolio-website</div>
        <div class="repo-tag">live</div>
      </div>
      <div class="repo-desc">Robot loyihalarini namoyish qilish uchun shaxsiy veb-sayt.</div>
      <div class="repo-meta">
        <span><span class="dotcolor"></span> HTML, CSS, JavaScript</span>
      </div>
    </a>
  </div>
</section>

<section class="section reveal" id="experience">
  <div class="wrap">
    <div class="ver-tag">v3.0.0</div>
    <div class="sec-title">Tajriba</div>
    <div class="sec-sub">// CHANGELOG.md</div>

    <div class="log-entry">
      <div class="log-dot"></div>
      <div>
        <div class="log-ver">Amaliy tajriba</div>
        <div class="log-role">Robototexnika bo'yicha bir necha yillik amaliy tajriba</div>
        <div class="log-desc">Bir nechta robot loyihalarini mustaqil ishlab chiqqanman.</div>
      </div>
    </div>

    <div class="log-entry">
      <div class="log-dot"></div>
      <div>
        <div class="log-ver">Musobaqalar</div>
        <div class="log-role">Robo Football, Robo Sumo va Line Follower musobaqalarida ishtirok</div>
        <div class="log-desc">Turli robototexnika musobaqalarida jamoa yoki mustaqil ishtirokchi sifatida qatnashganman.</div>
      </div>
    </div>

    <div class="log-entry">
      <div class="log-dot"></div>
      <div>
        <div class="log-ver">Web dasturlash</div>
        <div class="log-role">Shaxsiy loyihalar orqali web dasturlashni o'rganish</div>
        <div class="log-desc">HTML, CSS va JavaScript yordamida oddiy veb-saytlar yaratishni mustaqil o'rganganman.</div>
      </div>
    </div>
  </div>
</section>

<section class="section reveal" id="contact">
  <div class="wrap">
    <div class="ver-tag">v4.0.0</div>
    <div class="sec-title">Bog'lanish</div>
    <div class="sec-sub">// contact.sh</div>
    <div class="contact-term">
      <span class="prompt">guest@web</span>:<span class="path">~</span>$ cat contact.txt
    </div>
    <div class="contact-list">
      <a href="mailto:akbaraliyevabdulloh96@example.com"><span class="k">email</span> akbaraliyevabdulloh96@example.com</a>
      <a href="https://github.com/yourusername" target="_blank"><span class="k">github</span> github.com/yourusername</a>
      <a href="https://linkedin.com/in/yourusername" target="_blank"><span class="k">linkedin</span> linkedin.com/in/yourusername</a>
      <a href="tel:+998907760120"><span class="k">telefon</span> +998 90 776 01 20</a>
    </div>
  </div>
</section>

<footer>
  <div class="wrap">© 2026 Akbaraliyev Abdulloh. Built with HTML, CSS &amp; a bit of Arduino spirit.</div>
</footer>

<script>
  const revealEls = document.querySelectorAll('.reveal');
  const io = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{ if(e.isIntersecting){ e.target.classList.add('show'); io.unobserve(e.target); } });
  }, { threshold: 0.12 });
  revealEls.forEach(el=>io.observe(el));
</script>

</body>
</html>
