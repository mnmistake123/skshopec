{extends file='layouts/layout-content-only.tpl'}

{block name='content'}
{if $show_bonus}
    {* ======================== BONUS GIFT: Detective de tu Color ======================== *}
    <div class="skcourse-bonus">
        <div style="text-align:center; padding: 18px 20px 0;">
            <a href="{$course_url|escape:'html'}" style="color:#6b1e2e; font-size:14px; text-decoration:none;">
                ← Volver a módulos
            </a>
        </div>
        {literal}
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,500;0,600;0,700;1,500;1,600&family=Libre+Franklin:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500&display=swap">
<style>
  :root{
    --bg:#faf5ec;
    --bg-alt:#f1e7d9;
    --surface:#ffffff;
    --surface-2:#fbf6ee;
    --ink:#241e1a;
    --text-muted:#6e655c;
    --text-faint:#948a80;
    --line:rgba(36,30,26,.13);
    --line-strong:rgba(36,30,26,.24);
    --wine:#6b1e2e;
    --wine-deep:#4a1420;
    --wine-soft:rgba(107,30,46,.08);
    --wine-soft-2:rgba(107,30,46,.14);
    --check:#3f8f52;
    --cross:#c23b4e;
    --font-display:"Playfair Display","Iowan Old Style",ui-serif,serif;
    --font-body:"Libre Franklin",ui-sans-serif,system-ui,sans-serif;
    --font-mono:"IBM Plex Mono",ui-monospace,"SF Mono",monospace;
  }

  .skcourse-bonus{ background:var(--bg); color:var(--ink); font-family:var(--font-body); -webkit-font-smoothing:antialiased; padding-inline:20px; }
  @media(min-width:640px){ .skcourse-bonus{ padding-inline:32px; } }

  .skcourse-bonus h1,.skcourse-bonus h2,.skcourse-bonus h3{ font-family:var(--font-display); font-weight:600; text-wrap:balance; margin:0; }
  .skcourse-bonus p{ margin:0; line-height:1.6; }
  .skcourse-bonus button{ font-family:inherit; cursor:pointer; }
  .skcourse-bonus ::selection{ background:var(--wine-soft-2); color:var(--ink); }

  .skcourse-bonus .shell{ max-width:900px; margin:0 auto; padding-block:28px 90px; }

  .skcourse-bonus .topbar{
    display:flex; align-items:center; justify-content:space-between; gap:16px;
    padding-block:6px 30px;
  }
  .skcourse-bonus .brand{
    display:flex; align-items:baseline; gap:9px; font-family:var(--font-body);
    font-size:12.5px; letter-spacing:.11em; text-transform:uppercase; color:var(--text-faint); font-weight:600;
  }
  .skcourse-bonus .brand b{ color:var(--wine); font-weight:700; }

  .skcourse-bonus .fan{ display:flex; gap:6px; }
  .skcourse-bonus .fan[hidden]{ display:none; }
  .skcourse-bonus .fan i{ width:26px; height:5px; border-radius:3px; background:var(--line-strong); transition:background .3s ease, transform .3s ease; }
  .skcourse-bonus .fan i.done{ background:var(--wine); }
  .skcourse-bonus .fan i.active{ background:var(--wine); opacity:.55; transform:scaleY(1.6); }

  .skcourse-bonus .screen{ display:none; }
  .skcourse-bonus .screen.active{ display:block; animation:rise .5s cubic-bezier(.2,.7,.2,1); }
  @keyframes rise{ from{ opacity:0; transform:translateY(14px);} to{opacity:1; transform:translateY(0);} }
  @media (prefers-reduced-motion:reduce){ .skcourse-bonus .screen.active{ animation:none; } }

  /* ---------- intro ---------- */
  .skcourse-bonus .kicker{
    font-family:var(--font-body); font-size:12px; letter-spacing:.14em; text-transform:uppercase;
    color:var(--wine); font-weight:700; display:flex; align-items:center; gap:9px; margin-bottom:16px;
  }
  .skcourse-bonus .kicker::before{ content:""; width:22px; height:1px; background:var(--wine); }

  .skcourse-bonus .hero-grid{ display:grid; grid-template-columns:.92fr 1.08fr; gap:44px; align-items:center; }
  @media (max-width:760px){ .skcourse-bonus .hero-grid{ grid-template-columns:1fr; gap:32px; } }

  .skcourse-bonus .hero-title{ font-size:clamp(32px,5.6vw,46px); line-height:1.08; max-width:13ch; }
  .skcourse-bonus .hero-title em{ font-style:italic; color:var(--wine); font-weight:500; }
  .skcourse-bonus .hero-sub{ margin-top:18px; max-width:48ch; color:var(--text-muted); font-size:16px; }

  .skcourse-bonus .cta-row{ margin-top:32px; display:flex; align-items:center; gap:18px; flex-wrap:wrap; }
  .skcourse-bonus .btn{
    border:none; border-radius:999px; padding:16px 30px; font-size:13px; font-weight:700;
    letter-spacing:.06em; text-transform:uppercase; background:var(--wine); color:#fbf1ea;
    display:inline-flex; align-items:center; gap:10px; transition:transform .18s ease, box-shadow .18s ease, background .18s ease;
    box-shadow:0 14px 26px -14px rgba(107,30,46,.55);
  }
  .skcourse-bonus .btn:hover{ transform:translateY(-2px); background:var(--wine-deep); }
  .skcourse-bonus .btn:focus-visible{ outline:2px solid var(--wine); outline-offset:3px; }
  .skcourse-bonus .btn svg{ width:15px; height:15px; }
  .skcourse-bonus .btn-ghost{
    background:transparent; color:var(--ink); border:1px solid var(--line-strong); border-radius:999px;
    padding:15px 24px; font-size:13px; font-weight:600; letter-spacing:.04em;
  }
  .skcourse-bonus .btn-ghost:hover{ border-color:var(--wine); color:var(--wine); }
  .skcourse-bonus .btn-ghost:focus-visible{ outline:2px solid var(--wine); outline-offset:3px; }
  .skcourse-bonus .hint{ font-size:12.5px; color:var(--text-faint); font-family:var(--font-mono); }

  /* ---------- bloom (generative color visual, replaces photography) ---------- */
  .skcourse-bonus .bloom-wrap{ position:relative; aspect-ratio:1; }
  .skcourse-bonus .bloom-wrap::before{
    content:""; position:absolute; inset:16px -16px -16px 16px; border:1px solid var(--wine);
    border-radius:2px; z-index:0;
  }
  .skcourse-bonus .bloom{
    position:relative; z-index:1; width:100%; height:100%; border-radius:2px; overflow:hidden;
    background:var(--surface-2); border:1px solid var(--line);
  }
  .skcourse-bonus .bloom-blob{ position:absolute; border-radius:50%; mix-blend-mode:multiply; }
  .skcourse-bonus .bloom-dot{ position:absolute; border-radius:50%; box-shadow:0 10px 22px -12px rgba(36,30,26,.45); border:2px solid var(--surface); }
  .skcourse-bonus .bloom-cap{ position:absolute; left:18px; right:18px; bottom:16px; font-family:var(--font-mono); font-size:10.5px;
    letter-spacing:.05em; color:var(--ink); background:rgba(250,245,236,.82); backdrop-filter:blur(3px);
    padding:8px 10px; border-radius:3px; border:1px solid var(--line); }

  .skcourse-bonus .primer{ margin-top:38px; display:grid; grid-template-columns:repeat(4,1fr); gap:1px; background:var(--line); border:1px solid var(--line); border-radius:4px; overflow:hidden; }
  @media (max-width:640px){ .skcourse-bonus .primer{ grid-template-columns:repeat(2,1fr); } }
  .skcourse-bonus .primer-card{ background:var(--surface); padding:18px 16px; display:flex; flex-direction:column; gap:10px; }
  .skcourse-bonus .primer-card svg{ width:21px; height:21px; stroke:var(--fam-color,var(--wine)); }
  .skcourse-bonus .primer-card h3{ font-size:15px; font-weight:600; font-family:var(--font-body); }
  .skcourse-bonus .primer-card p{ font-size:12.8px; color:var(--text-muted); line-height:1.45; }
  .skcourse-bonus .primer-strip{ display:flex; gap:4px; margin-top:2px; }
  .skcourse-bonus .primer-strip span{ width:14px; height:14px; border-radius:3px; display:block; }

  /* ---------- quiz ---------- */
  .skcourse-bonus .quiz-head{ display:flex; align-items:flex-end; justify-content:space-between; gap:12px; flex-wrap:wrap; margin-bottom:22px; }
  .skcourse-bonus .step-label{ font-family:var(--font-body); font-size:12px; letter-spacing:.1em; text-transform:uppercase; color:var(--wine); font-weight:700; }
  .skcourse-bonus .q-count{ font-family:var(--font-mono); font-size:12px; color:var(--text-faint); }

  .skcourse-bonus .axis-readout{ display:flex; flex-direction:column; gap:9px; margin-bottom:28px; }
  .skcourse-bonus .axis-row{ display:grid; grid-template-columns:74px 1fr 74px; align-items:center; gap:10px; }
  .skcourse-bonus .axis-row span{ font-size:11px; font-family:var(--font-body); font-weight:600; letter-spacing:.02em; color:var(--text-faint); }
  .skcourse-bonus .axis-row span:last-child{ text-align:right; }
  .skcourse-bonus .axis-track{ height:5px; border-radius:3px; background:var(--line-strong); position:relative; overflow:hidden; }
  .skcourse-bonus .axis-fill{ position:absolute; inset:0; width:100%; border-radius:3px; transition:transform .5s cubic-bezier(.2,.8,.2,1); transform-origin:left; background:linear-gradient(90deg,#d9c8b3,var(--wine)); }

  .skcourse-bonus .q-card{ background:var(--surface); border:1px solid var(--line); border-radius:4px; padding:32px 28px; box-shadow:0 24px 48px -32px rgba(36,30,26,.28); }
  @media (max-width:640px){ .skcourse-bonus .q-card{ padding:24px 18px; } }
  .skcourse-bonus .q-text{ font-size:clamp(19px,3.4vw,23px); max-width:34ch; margin-bottom:22px; font-family:var(--font-display); font-weight:600; }

  .skcourse-bonus .options{ display:grid; grid-template-columns:1fr 1fr; gap:11px; }
  @media (max-width:560px){ .skcourse-bonus .options{ grid-template-columns:1fr; } }
  .skcourse-bonus .opt{
    display:flex; align-items:center; gap:13px; text-align:left; background:var(--surface-2);
    border:1px solid var(--line); border-radius:3px; padding:14px 15px; color:var(--ink);
    transition:border-color .16s ease, background .16s ease, transform .16s ease;
  }
  .skcourse-bonus .opt:hover{ border-color:var(--wine); background:var(--surface); transform:translateY(-1px); }
  .skcourse-bonus .opt:focus-visible{ outline:2px solid var(--wine); outline-offset:2px; }
  .skcourse-bonus .opt .swatch{ width:30px; height:30px; border-radius:6px; flex:none; border:1px solid var(--line-strong); }
  .skcourse-bonus .opt .swatch.split{ background:linear-gradient(135deg,var(--c1) 50%,var(--c2) 50%); }
  .skcourse-bonus .opt .swatch.dots{ background:var(--c1); position:relative; }
  .skcourse-bonus .opt .swatch.dots::after{ content:""; position:absolute; inset:5px; border-radius:4px;
    background:radial-gradient(circle at 30% 30%,var(--c2) 0 3px,transparent 3.5px),
               radial-gradient(circle at 70% 60%,var(--c2) 0 3px,transparent 3.5px),
               radial-gradient(circle at 45% 75%,var(--c2) 0 3px,transparent 3.5px); }
  .skcourse-bonus .opt .lbl{ font-size:14.5px; line-height:1.35; font-weight:500; }
  .skcourse-bonus .opt .lbl small{ display:block; font-weight:400; color:var(--text-faint); font-size:12px; margin-top:2px; }

  .skcourse-bonus .q-foot{ margin-top:22px; display:flex; justify-content:space-between; align-items:center; }
  .skcourse-bonus .link-back{ background:none; border:none; color:var(--text-faint); font-size:13px; font-family:var(--font-mono); display:flex; gap:6px; align-items:center; }
  .skcourse-bonus .link-back:hover{ color:var(--ink); }
  .skcourse-bonus .link-back svg{ width:13px; height:13px; }

  /* ---------- reveal ---------- */
  .skcourse-bonus .reveal-wrap{ min-height:56vh; display:flex; flex-direction:column; align-items:center; justify-content:center; text-align:center; gap:22px; padding-block:60px; }
  .skcourse-bonus .brew{ width:110px; height:110px; border-radius:50%; position:relative; }
  .skcourse-bonus .brew i{ position:absolute; inset:0; border-radius:50%; opacity:.9; animation:spin 2.6s linear infinite; }
  .skcourse-bonus .brew i:nth-child(1){ background:conic-gradient(from 0deg, var(--wine), transparent 45%); }
  .skcourse-bonus .brew i:nth-child(2){ background:conic-gradient(from 180deg, #d9c8b3, transparent 45%); animation-duration:3.4s; animation-direction:reverse; }
  @keyframes spin{ to{ transform:rotate(360deg);} }
  @media (prefers-reduced-motion:reduce){ .skcourse-bonus .brew i{ animation:none; } }
  .skcourse-bonus .reveal-text{ font-family:var(--font-mono); font-size:13px; color:var(--text-muted); letter-spacing:.03em; }

  /* ---------- result ---------- */
  .skcourse-bonus .result-hero{ display:grid; grid-template-columns:1.05fr .95fr; gap:44px; align-items:center; padding-block:14px 6px; }
  @media (max-width:760px){ .skcourse-bonus .result-hero{ grid-template-columns:1fr; gap:30px; } }
  .skcourse-bonus .fam-tag{ display:inline-flex; align-items:center; gap:8px; font-family:var(--font-body); font-size:12px; font-weight:700;
    letter-spacing:.1em; text-transform:uppercase; padding:7px 13px; border-radius:999px;
    border:1px solid var(--line-strong); color:var(--fam-color); margin-bottom:18px; }
  .skcourse-bonus .fam-tag svg{ width:14px; height:14px; stroke:var(--fam-color); }

  .skcourse-bonus .result-name{ font-size:clamp(36px,7vw,58px); line-height:1.04; font-style:italic; font-weight:500; color:var(--fam-color); }
  .skcourse-bonus .result-meta{ margin-top:16px; font-size:16px; color:var(--text-muted); max-width:52ch; }
  .skcourse-bonus .result-meta strong{ color:var(--ink); font-weight:600; }

  .skcourse-bonus .axis-summary{ display:grid; grid-template-columns:repeat(3,1fr); gap:1px; background:var(--line);
    border:1px solid var(--line); border-radius:4px; overflow:hidden; margin-top:30px; }
  @media (max-width:640px){ .skcourse-bonus .axis-summary{ grid-template-columns:1fr; } }
  .skcourse-bonus .axis-cell{ background:var(--surface); padding:18px 18px; }
  .skcourse-bonus .axis-cell h4{ font-family:var(--font-body); font-size:10.5px; letter-spacing:.1em; text-transform:uppercase; color:var(--text-faint); font-weight:700; margin-bottom:8px; }
  .skcourse-bonus .axis-cell p{ font-size:15px; font-weight:600; font-family:var(--font-display); }
  .skcourse-bonus .axis-cell span{ display:block; font-size:12.5px; color:var(--text-muted); margin-top:5px; font-weight:400; line-height:1.4; }

  .skcourse-bonus .section-head{ margin-top:58px; margin-bottom:20px; }
  .skcourse-bonus .section-head .kicker{ margin-bottom:10px; }
  .skcourse-bonus .section-head h2{ font-size:clamp(24px,4vw,30px); max-width:22ch; }
  .skcourse-bonus .section-head p{ margin-top:10px; color:var(--text-muted); max-width:58ch; font-size:15px; }

  .skcourse-bonus .stars-row{ display:flex; gap:12px; flex-wrap:wrap; }
  .skcourse-bonus .star-chip{ display:flex; flex-direction:column; align-items:center; gap:9px; width:92px; }
  .skcourse-bonus .star-chip .sw{ width:70px; height:70px; border-radius:8px; border:1px solid var(--line-strong); box-shadow:0 14px 26px -16px rgba(36,30,26,.4); }
  .skcourse-bonus .star-chip .name{ font-size:11.5px; text-align:center; color:var(--text-muted); line-height:1.3; }
  .skcourse-bonus .star-chip .hex{ font-family:var(--font-mono); font-size:10px; color:var(--text-faint); }

  .skcourse-bonus .palette-grid{ display:grid; grid-template-columns:repeat(6,1fr); gap:10px; }
  @media (max-width:720px){ .skcourse-bonus .palette-grid{ grid-template-columns:repeat(4,1fr); } }
  @media (max-width:460px){ .skcourse-bonus .palette-grid{ grid-template-columns:repeat(3,1fr); } }
  .skcourse-bonus .swatch-cell{ aspect-ratio:1; border-radius:6px; border:1px solid var(--line-strong); position:relative; overflow:hidden; }
  .skcourse-bonus .swatch-cell .tip{ position:absolute; inset:auto 0 0 0; padding:6px 7px 5px; font-family:var(--font-mono);
    font-size:9px; background:linear-gradient(0deg,rgba(0,0,0,.55),transparent); color:#fff; opacity:0; transition:opacity .15s ease; }
  .skcourse-bonus .swatch-cell:hover .tip{ opacity:1; }

  .skcourse-bonus .guide-grid{ display:grid; grid-template-columns:repeat(3,1fr); gap:14px; }
  @media (max-width:900px){ .skcourse-bonus .guide-grid{ grid-template-columns:repeat(2,1fr); } }
  @media (max-width:480px){ .skcourse-bonus .guide-grid{ grid-template-columns:1fr; } }
  .skcourse-bonus .guide-card{ background:var(--surface); border:1px solid var(--line); border-radius:4px; padding:16px; display:flex; flex-direction:column; gap:10px; }
  .skcourse-bonus .guide-card h4{ font-family:var(--font-body); font-size:10.5px; text-transform:uppercase; letter-spacing:.09em; color:var(--text-faint); font-weight:700; }
  .skcourse-bonus .guide-card .name-line{ font-size:13.8px; font-weight:600; font-family:var(--font-display); }
  .skcourse-bonus .guide-card .tip{ font-size:12.3px; color:var(--text-muted); line-height:1.4; font-weight:400; font-family:var(--font-body); }
  .skcourse-bonus .tri-swatch{ display:flex; gap:7px; }
  .skcourse-bonus .tri-item{ flex:1; display:flex; flex-direction:column; align-items:center; gap:5px; min-width:0; }
  .skcourse-bonus .tri-item .sw{ width:100%; aspect-ratio:1; border-radius:6px; border:1px solid var(--line-strong); }
  .skcourse-bonus .tri-item span{ font-size:9.3px; color:var(--text-faint); text-align:center; line-height:1.25; }

  .skcourse-bonus .avoid-row{ display:flex; gap:14px; flex-wrap:wrap; }
  .skcourse-bonus .avoid-chip{ display:flex; align-items:center; gap:10px; background:var(--surface); border:1px solid var(--line); border-radius:4px; padding:9px 14px 9px 9px; }
  .skcourse-bonus .avoid-chip .sw{ width:32px; height:32px; border-radius:5px; position:relative; border:1px solid var(--line-strong); }
  .skcourse-bonus .avoid-chip .sw::after, .skcourse-bonus .avoid-chip .sw::before{ content:""; position:absolute; background:var(--cross); height:2px; width:140%; top:50%; left:-20%; opacity:.85; }
  .skcourse-bonus .avoid-chip .sw::after{ transform:rotate(45deg); }
  .skcourse-bonus .avoid-chip .sw::before{ transform:rotate(-45deg); }
  .skcourse-bonus .avoid-chip span{ font-size:13px; color:var(--text-muted); }

  .skcourse-bonus .celeb-row{ display:flex; gap:16px; flex-wrap:wrap; }
  .skcourse-bonus .celeb-card{ width:104px; display:flex; flex-direction:column; align-items:center; gap:8px; text-align:center; }
  .skcourse-bonus .celeb-card .photo-wrap{ position:relative; width:96px; height:96px; }
  .skcourse-bonus .celeb-card .photo{ position:absolute; inset:0; width:96px; height:96px; border-radius:50%; object-fit:cover; border:2px solid var(--fam-color,var(--line-strong)); background:var(--surface-2); }
  .skcourse-bonus .celeb-card .photo.placeholder{ display:flex; align-items:center; justify-content:center; font-family:var(--font-display); font-weight:600; font-size:26px; color:#fff; background:var(--fam-color,var(--wine)); z-index:0; }
  .skcourse-bonus .celeb-card img.photo{ z-index:1; }
  .skcourse-bonus .celeb-card .name{ font-size:11.5px; color:var(--text-muted); line-height:1.3; }
  .skcourse-bonus #celeb-section[hidden]{ display:none; }

  .skcourse-bonus .why-card{ margin-top:26px; background:var(--bg-alt); border:1px solid var(--line); border-radius:4px; padding:20px 22px; }
  .skcourse-bonus .why-card p{ font-size:13.8px; color:var(--text-muted); line-height:1.65; }
  .skcourse-bonus .why-card strong{ color:var(--ink); }

  .skcourse-bonus .end-row{ margin-top:60px; display:flex; gap:14px; flex-wrap:wrap; align-items:center; border-top:1px solid var(--line); padding-top:28px; }
  .skcourse-bonus .copied-msg{ font-family:var(--font-mono); font-size:12px; color:var(--wine); opacity:0; transition:opacity .2s ease; }
  .skcourse-bonus .copied-msg.show{ opacity:1; }

  .skcourse-bonus .footer-note{ margin-top:48px; font-size:12px; color:var(--text-faint); font-family:var(--font-mono); max-width:60ch; line-height:1.6; }
</style>

<div class="shell">

  <div class="topbar">
    <div class="brand">detective de <b>color</b></div>
    <div class="fan" id="fan" hidden>
      <i data-i="0"></i><i data-i="1"></i><i data-i="2"></i>
    </div>
  </div>

  <!-- INTRO -->
  <section class="screen active" data-screen="intro">
    <div class="hero-grid">
      <div class="bloom-wrap">
        <div class="bloom" id="bloom-intro"></div>
      </div>
      <div>
        <div class="kicker">colorimetría estacional · 12 estaciones</div>
        <h1 class="hero-title">Descubre el color que <em>te ilumina</em></h1>
        <p class="hero-sub">La colorimetría es un juego de detective: con solo mirar el color de tus venas, tus ojos y tu cabello, podemos descubrir qué colores de ropa hacen que tu cara se vea más sana, más despierta y más tú. Vamos a resolver el caso en 10 pistas.</p>
        <div class="cta-row">
          <button class="btn" id="start-btn">Empezar el caso
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
          </button>
          <span class="hint">10 preguntas · ~2 minutos</span>
        </div>
      </div>
    </div>

    <div class="primer">
      <div class="primer-card" style="--fam-color:#b8590c">
        <svg viewBox="0 0 24 24" fill="none" stroke-width="1.6"><path d="M12 3v3M12 18v3M4.2 4.2l2.1 2.1M17.7 17.7l2.1 2.1M3 12h3M18 12h3M4.2 19.8l2.1-2.1M17.7 6.3l2.1-2.1"/><circle cx="12" cy="12" r="4"/></svg>
        <h3>Primavera</h3>
        <p>Cálida y clara, como una mañana de sol nuevo.</p>
        <div class="primer-strip"><span style="background:#FFB88C"></span><span style="background:#FFE28A"></span><span style="background:#8FE3D6"></span></div>
      </div>
      <div class="primer-card" style="--fam-color:#3e6e7a">
        <svg viewBox="0 0 24 24" fill="none" stroke-width="1.6"><path d="M3 15c2-2 4-2 6 0s4 2 6 0 4-2 6 0M3 19c2-2 4-2 6 0s4 2 6 0 4-2 6 0"/><circle cx="12" cy="7" r="3.4"/></svg>
        <h3>Verano</h3>
        <p>Fría y suave, como la brisa junto al mar.</p>
        <div class="primer-strip"><span style="background:#C8B6E2"></span><span style="background:#A9C6E8"></span><span style="background:#B7CFC0"></span></div>
      </div>
      <div class="primer-card" style="--fam-color:#8a4014">
        <svg viewBox="0 0 24 24" fill="none" stroke-width="1.6"><path d="M12 2c3 3 5 6 5 9a5 5 0 0 1-10 0c0-3 2-6 5-9Z"/><path d="M12 13v9"/></svg>
        <h3>Otoño</h3>
        <p>Cálida y profunda, como hojas de octubre.</p>
        <div class="primer-strip"><span style="background:#C99A2E"></span><span style="background:#B5522E"></span><span style="background:#556B2F"></span></div>
      </div>
      <div class="primer-card" style="--fam-color:#35407a">
        <svg viewBox="0 0 24 24" fill="none" stroke-width="1.6"><path d="M12 2v20M4.5 6.5l15 11M19.5 6.5l-15 11"/></svg>
        <h3>Invierno</h3>
        <p>Fría e intensa, como una noche clara y nítida.</p>
        <div class="primer-strip"><span style="background:#1E3A8A"></span><span style="background:#C2185B"></span><span style="background:#00695C"></span></div>
      </div>
    </div>
  </section>

  <!-- QUIZ -->
  <section class="screen" data-screen="quiz">
    <div class="quiz-head">
      <span class="step-label" id="step-label">Paso 1 · Subtono</span>
      <span class="q-count" id="q-count">Pregunta 1 de 10</span>
    </div>

    <div class="axis-readout">
      <div class="axis-row"><span>Frío</span><div class="axis-track"><div class="axis-fill" id="ax-subtono"></div></div><span>Cálido</span></div>
      <div class="axis-row"><span>Claro</span><div class="axis-track"><div class="axis-fill" id="ax-valor"></div></div><span>Profundo</span></div>
      <div class="axis-row"><span>Suave</span><div class="axis-track"><div class="axis-fill" id="ax-intensidad"></div></div><span>Brillante</span></div>
    </div>

    <div class="q-card">
      <p class="q-text" id="q-text"></p>
      <div class="options" id="q-options"></div>
      <div class="q-foot">
        <button class="link-back" id="back-btn">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"><path d="M19 12H5M11 6l-6 6 6 6"/></svg>
          anterior
        </button>
        <span class="hint" id="axis-hint">pista sobre tu subtono</span>
      </div>
    </div>
  </section>

  <!-- REVEAL -->
  <section class="screen" data-screen="reveal">
    <div class="reveal-wrap">
      <div class="brew"><i></i><i></i></div>
      <p class="reveal-text" id="reveal-text">mezclando tus pistas…</p>
    </div>
  </section>

  <!-- RESULT -->
  <section class="screen" data-screen="result">
    <div class="result-hero">
      <div>
        <div class="fam-tag" id="fam-tag"></div>
        <h1 class="result-name" id="result-name"></h1>
        <p class="result-meta" id="result-meta"></p>
      </div>
      <div class="bloom-wrap">
        <div class="bloom" id="bloom-result"></div>
      </div>
    </div>

    <div class="axis-summary" id="axis-summary"></div>

    <div class="why-card">
      <p id="why-text"></p>
    </div>

    <div class="section-head">
      <div class="kicker">tus 5 colores estrella</div>
      <h2>Los que te hacen ver más despierta</h2>
      <p>Elegimos las opciones más versátiles y fáciles de llevar de tu paleta — pensadas para el día a día, no solo para una ocasión especial. Úsalos cerca de la cara: blusas, bufandas, el cuello de una chaqueta.</p>
    </div>
    <div class="stars-row" id="stars-row"></div>

    <div class="section-head">
      <div class="kicker">paleta completa</div>
      <h2>Tus 12 colores de temporada</h2>
      <p>Pasa el cursor (o mantén presionado en el celular) sobre cada color para ver su nombre y su código.</p>
    </div>
    <div class="palette-grid" id="palette-grid"></div>

    <div class="section-head">
      <div class="kicker">guía de prendas</div>
      <h2>El color ideal para cada pieza de tu clóset</h2>
      <p>Cada tarjeta muestra tres colores para combinar: tu <strong>base</strong> neutra, el color <strong>principal</strong> de la prenda y un <strong>acento</strong> para accesorios o detalles.</p>
    </div>
    <div class="guide-grid" id="guide-grid"></div>

    <div class="section-head">
      <div class="kicker">con cuidado</div>
      <h2>Colores que le restan luz a tu cara</h2>
      <p>No son colores "prohibidos" — son solo los que más te alejan de tu punto más luminoso. Úsalos lejos del rostro (un pantalón, un zapato) si te encantan.</p>
    </div>
    <div class="avoid-row" id="avoid-row"></div>

    <div id="celeb-section" hidden>
      <div class="section-head">
        <div class="kicker">celebridades de tu estación</div>
        <h2>Rostros que comparten tu paleta</h2>
        <p>Personas públicas que suelen ubicarse en tu misma familia de color — obsérvalas la próxima vez que busques inspiración de outfit o maquillaje.</p>
      </div>
      <div class="celeb-row" id="celeb-row"></div>
    </div>

    <div class="end-row">
      <button class="btn-ghost" id="copy-btn">Copiar mi resultado</button>
      <button class="btn-ghost" id="restart-btn">Resolver otro caso</button>
      <span class="copied-msg" id="copied-msg">copiado ✓</span>
    </div>

    <p class="footer-note">Esta es una herramienta educativa de introducción a la colorimetría estacional, pensada para explicar el método de forma simple. Un análisis profesional en persona, con luz natural directa sobre el rostro, siempre da un resultado más preciso.</p>
  </section>

</div>

<script>
(function(){
  "use strict";

  /* ============ DATA: QUESTIONS ============ */
  var QUESTIONS = [
    // --- PASO 1: SUBTONO ---
    { axis:"subtono", step:0, text:"Mira las venas de tu muñeca con luz de día. ¿De qué color se ven?",
      hint:"pista sobre tu subtono",
      options:[
        {label:"Verdosas u oliva", d:2, sw:{type:"solid", c1:"#7a8f5a"}},
        {label:"Azules o moradas", d:-2, sw:{type:"solid", c1:"#5c6f9e"}},
        {label:"Una mezcla, no distingo bien", d:0, sw:{type:"split", c1:"#7a8f5a", c2:"#5c6f9e"}}
      ]},
    { axis:"subtono", step:0, text:"¿Qué joya te hace lucir más radiante junto a la cara?",
      hint:"pista sobre tu subtono",
      options:[
        {label:"Oro", small:"cálido y dorado", d:1, sw:{type:"solid", c1:"#d4af37"}},
        {label:"Plata", small:"frío y plateado", d:-1, sw:{type:"solid", c1:"#c0c0c0"}},
        {label:"Los dos me quedan igual de bien", d:0, sw:{type:"split", c1:"#d4af37", c2:"#c0c0c0"}}
      ]},
    { axis:"subtono", step:0, text:"Bajo el sol, tu piel…",
      hint:"pista sobre tu subtono",
      options:[
        {label:"Se broncea fácil", small:"rara vez se quema", d:1, sw:{type:"solid", c1:"#c9834a"}},
        {label:"Se quema fácil", small:"le cuesta broncearse", d:-1, sw:{type:"solid", c1:"#e8b4a0"}},
        {label:"Un poco de ambas cosas", d:0, sw:{type:"split", c1:"#c9834a", c2:"#e8b4a0"}}
      ]},
    { axis:"subtono", step:0, text:"¿Qué tono de blanco ilumina más tu rostro en el espejo?",
      hint:"pista sobre tu subtono",
      options:[
        {label:"Blanco marfil o hueso", small:"un blanco cálido", d:1, sw:{type:"solid", c1:"#f3e9d2"}},
        {label:"Blanco puro o nieve", small:"un blanco frío", d:-1, sw:{type:"solid", c1:"#f7f8fa"}},
        {label:"No estoy segura", d:0, sw:{type:"split", c1:"#f3e9d2", c2:"#f7f8fa"}}
      ]},
    // --- PASO 2: VALOR ---
    { axis:"valor", step:1, text:"¿Cuál es tu color de cabello más natural (o el más cercano a tu raíz)?",
      hint:"pista sobre tu claridad",
      options:[
        {label:"Rubio muy claro o platino", d:-2, sw:{type:"solid", c1:"#e9d9a8"}},
        {label:"Rubio dorado o castaño claro", d:-1, sw:{type:"solid", c1:"#b98d55"}},
        {label:"Castaño medio", d:0, sw:{type:"solid", c1:"#7a5636"}},
        {label:"Castaño oscuro", d:1, sw:{type:"solid", c1:"#4a3325"}},
        {label:"Negro", d:2, sw:{type:"solid", c1:"#1c1712"}}
      ]},
    { axis:"valor", step:1, text:"¿Qué tan oscuros son tus ojos?",
      hint:"pista sobre tu claridad",
      options:[
        {label:"Muy claros", small:"celeste, gris, verde claro", d:-2, sw:{type:"solid", c1:"#a9c6e8"}},
        {label:"Claros medios", small:"avellana, verde", d:-1, sw:{type:"solid", c1:"#8fae7a"}},
        {label:"Café medio o miel", d:0, sw:{type:"solid", c1:"#8a5a2e"}},
        {label:"Café oscuro", d:1, sw:{type:"solid", c1:"#4a2f18"}},
        {label:"Casi negro", d:2, sw:{type:"solid", c1:"#1c140d"}}
      ]},
    { axis:"valor", step:1, text:"En conjunto (piel + cabello + ojos), ¿tu imagen general se ve…?",
      hint:"pista sobre tu claridad",
      options:[
        {label:"Muy clara y suave", d:-1, sw:{type:"solid", c1:"#e8dcc8"}},
        {label:"Balanceada, ni clara ni oscura", d:0, sw:{type:"solid", c1:"#9c8768"}},
        {label:"Intensa y oscura", d:1, sw:{type:"solid", c1:"#332419"}}
      ]},
    // --- PASO 3: INTENSIDAD ---
    { axis:"intensidad", step:2, text:"Mírate de cerca al espejo: el color de tus ojos es…",
      hint:"pista sobre tu intensidad",
      options:[
        {label:"Un solo color sólido y definido", d:2, sw:{type:"solid", c1:"#5b7a4a"}},
        {label:"Varias motas o tonos mezclados", small:"como un caleidoscopio", d:-2, sw:{type:"dots", c1:"#5b7a4a", c2:"#c9a15a"}},
        {label:"Un poco de ambos", d:0, sw:{type:"solid", c1:"#7a8a5f"}}
      ]},
    { axis:"intensidad", step:2, text:"¿Cómo describirías el brillo natural de tu piel y cabello?",
      hint:"pista sobre tu intensidad",
      options:[
        {label:"Muy brillante", small:"casi como vidrio", d:1, sw:{type:"solid", c1:"#e0c98a"}},
        {label:"Mate y suave", small:"sin mucho brillo", d:-1, sw:{type:"solid", c1:"#c4b49a"}},
        {label:"Término medio", d:0, sw:{type:"split", c1:"#e0c98a", c2:"#c4b49a"}}
      ]},
    { axis:"intensidad", step:2, text:"Piensa en un fucsia vibrante frente a un beige apagado: ¿cuál se ve mejor en ti?",
      hint:"pista sobre tu intensidad",
      options:[
        {label:"El vibrante", small:"me da vida", d:2, sw:{type:"solid", c1:"#e8117f"}},
        {label:"El apagado", small:"se ve más natural en mí", d:-2, sw:{type:"solid", c1:"#c9ab8f"}},
        {label:"No estoy segura", d:0, sw:{type:"split", c1:"#e8117f", c2:"#c9ab8f"}}
      ]}
  ];

  var STEP_NAMES = ["Paso 1 · Subtono","Paso 2 · Claridad","Paso 3 · Intensidad"];

  /* ============ DATA: SEASONS ============ */
  function C(h,n,role){ return {h:h, n:n, role:role||null}; }

  var SEASONS = {
    "primavera-clara": { family:"primavera", famColor:"#b8590c", name:"Primavera Clara", meta:"La más luminosa de las estaciones cálidas.",
      metaphor:"Eres como el primer rayo de sol en una mañana de abril: cálida, ligera y fresca.",
      palette:[C("#FFB88C","Durazno"),C("#FF9E80","Coral suave","accent"),C("#FFE28A","Amarillo mantequilla"),C("#B4E197","Verde manzana"),C("#8FE3D6","Turquesa claro"),C("#FFC4B0","Rosa melocotón"),C("#E8C39E","Camel claro"),C("#FFF3E0","Marfil cálido","neutral"),C("#A8D8E8","Azul cielo cálido"),C("#FF8FA3","Coral rosado","lip"),C("#A0E8C0","Verde menta"),C("#E6C77A","Dorado claro","metal")],
      stars:["#FFB88C","#FFE28A","#B4E197","#8FE3D6","#E8C39E"],
      denim:{h:"#4A7FA5", n:"Denim azul cálido, lavado medio"},
      baseSet:[{h:"#FFF3E0",n:"Marfil cálido"},{h:"#E8C39E",n:"Camel claro"},{h:"#E6C77A",n:"Dorado claro"}],
      accentSet:[{h:"#FF9E80",n:"Coral suave"},{h:"#FF8FA3",n:"Coral rosado"},{h:"#8FE3D6",n:"Turquesa claro"}],
      avoid:[C("#000000","Negro puro"),C("#6E7B85","Gris ceniza frío"),C("#4B1E6B","Morado intenso frío")] },

    "primavera-calida": { family:"primavera", famColor:"#b8590c", name:"Primavera Cálida", meta:"El corazón de la familia primavera: cálida y viva.",
      metaphor:"Eres como un jardín en su mejor momento: cálida, jugosa y llena de vida.",
      palette:[C("#F4A261","Naranja damasco"),C("#F6C445","Amarillo girasol"),C("#8BC34A","Verde hierba"),C("#4DB6AC","Turquesa cálido"),C("#FF6F59","Coral","lip"),C("#E07A5F","Terracota clara"),C("#D9A066","Camel"),C("#FFF8E7","Marfil","neutral"),C("#E63946","Rojo tomate","accent"),C("#3FA7A0","Aguamarina"),C("#A9BA5A","Verde oliva claro"),C("#D4AF37","Oro","metal")],
      stars:["#F4A261","#D9A066","#A9BA5A","#3FA7A0","#E07A5F"],
      denim:{h:"#4A7FA5", n:"Denim azul cálido, lavado medio"},
      baseSet:[{h:"#FFF8E7",n:"Marfil"},{h:"#D9A066",n:"Camel"},{h:"#D4AF37",n:"Oro"}],
      accentSet:[{h:"#E63946",n:"Rojo tomate"},{h:"#FF6F59",n:"Coral"},{h:"#4DB6AC",n:"Turquesa cálido"}],
      avoid:[C("#000000","Negro puro"),C("#C2185B","Fucsia frío"),C("#78909C","Gris azulado")] },

    "primavera-brillante": { family:"primavera", famColor:"#b8590c", name:"Primavera Brillante", meta:"Cálida y clara — pero sobre todo, imposible de ignorar.",
      metaphor:"Eres como fuegos artificiales en verano: viva, nítida, con mucha chispa.",
      palette:[C("#FF7A29","Naranja mandarina"),C("#FFE900","Amarillo limón"),C("#00C776","Esmeralda claro"),C("#00BFC1","Turquesa vibrante"),C("#FF3D7F","Fucsia cálido","lip"),C("#E8112D","Rojo cereza","accent"),C("#2C9EE8","Azul eléctrico"),C("#8E4FDB","Violeta cálido"),C("#FFFFFF","Blanco puro","neutral"),C("#DDA43C","Camel dorado"),C("#B4D400","Verde lima"),C("#F0C419","Oro brillante","metal")],
      stars:["#FF7A29","#00BFC1","#DDA43C","#F0C419","#2C9EE8"],
      denim:{h:"#4A7FA5", n:"Denim azul brillante, sin desgaste"},
      baseSet:[{h:"#FFFFFF",n:"Blanco puro"},{h:"#DDA43C",n:"Camel dorado"},{h:"#F0C419",n:"Oro brillante"}],
      accentSet:[{h:"#E8112D",n:"Rojo cereza"},{h:"#FF3D7F",n:"Fucsia cálido"},{h:"#2C9EE8",n:"Azul eléctrico"}],
      avoid:[C("#7A5C46","Marrón apagado"),C("#C9B79C","Beige polvoso"),C("#E8DDD3","Pastel deslavado")] },

    "verano-claro": { family:"verano", famColor:"#3e6e7a", name:"Verano Claro", meta:"La más luminosa de las estaciones frías.",
      metaphor:"Eres como la neblina suave de una mañana de playa: fresca y delicada.",
      palette:[C("#E8B4C0","Rosa empolvado"),C("#C8B6E2","Lavanda","accent"),C("#A9C6E8","Azul hielo"),C("#B7CFC0","Verde salvia claro"),C("#D6D2D0","Gris perla"),C("#A7D8E8","Celeste"),C("#E6C6CB","Rosa palo","lip"),C("#B4CDE6","Azul pastel"),C("#C9A9C4","Malva"),C("#F5F3F0","Blanco perla","neutral"),C("#B8DFCF","Menta suave"),C("#C7CDD1","Plata","metal")],
      stars:["#C8B6E2","#A9C6E8","#E8B4C0","#A7D8E8","#B8DFCF"],
      denim:{h:"#5C7A99", n:"Denim azul frío, lavado clásico"},
      baseSet:[{h:"#F5F3F0",n:"Blanco perla"},{h:"#D6D2D0",n:"Gris perla"},{h:"#C7CDD1",n:"Plata"}],
      accentSet:[{h:"#C8B6E2",n:"Lavanda"},{h:"#E6C6CB",n:"Rosa palo"},{h:"#C9A9C4",n:"Malva"}],
      avoid:[C("#E8590C","Naranja intenso"),C("#000000","Negro puro"),C("#C9A227","Mostaza")] },

    "verano-frio": { family:"verano", famColor:"#3e6e7a", name:"Verano Frío", meta:"El corazón de la familia verano: fría y serena.",
      metaphor:"Eres el azul del mar en un día nublado: fresca, calmada, elegante.",
      palette:[C("#6D8CA6","Azul acero"),C("#9C8FB0","Lavanda grisácea"),C("#D98CA6","Rosa frío"),C("#7FA391","Verde grisáceo"),C("#8E5B7A","Ciruela","lip"),C("#3F5C73","Azul marino suave"),C("#8D9AA5","Gris azulado"),C("#F0F1F3","Blanco frío","neutral"),C("#B0507A","Fucsia apagado","accent"),C("#6B4A63","Berenjena"),C("#8FB1C7","Azul cielo grisáceo"),C("#B7BEC4","Plata","metal")],
      stars:["#6D8CA6","#9C8FB0","#8FB1C7","#7FA391","#8D9AA5"],
      denim:{h:"#5C7A99", n:"Denim azul frío, lavado clásico"},
      baseSet:[{h:"#F0F1F3",n:"Blanco frío"},{h:"#8D9AA5",n:"Gris azulado"},{h:"#B7BEC4",n:"Plata"}],
      accentSet:[{h:"#B0507A",n:"Fucsia apagado"},{h:"#8E5B7A",n:"Ciruela"},{h:"#6B4A63",n:"Berenjena"}],
      avoid:[C("#E8590C","Naranja"),C("#D4AF37","Dorado brillante"),C("#F6C445","Amarillo cálido")] },

    "verano-suave": { family:"verano", famColor:"#3e6e7a", name:"Verano Suave", meta:"Fría y apagada — nunca grita, siempre susurra.",
      metaphor:"Eres colores de acuarela: suaves, mezclados, nunca estridentes.",
      palette:[C("#C79FA0","Rosa malva"),C("#94A88F","Verde eucalipto"),C("#8FA0AD","Azul humo"),C("#9C7E8A","Ciruela suave","lip"),C("#ABA39A","Gris cálido"),C("#B98A76","Terracota apagada"),C("#A99BB0","Lavanda polvo"),C("#D9C3B8","Beige rosado","neutral"),C("#8E9678","Verde oliva grisáceo"),C("#7E93A0","Azul grisáceo"),C("#8A4F5A","Vino apagado","accent"),C("#B0AAA2","Plata mate","metal")],
      stars:["#94A88F","#9C7E8A","#8FA0AD","#C79FA0","#8A4F5A"],
      denim:{h:"#7488a0", n:"Denim gris-azulado, lavado suave"},
      baseSet:[{h:"#D9C3B8",n:"Beige rosado"},{h:"#ABA39A",n:"Gris cálido"},{h:"#B0AAA2",n:"Plata mate"}],
      accentSet:[{h:"#8A4F5A",n:"Vino apagado"},{h:"#9C7E8A",n:"Ciruela suave"},{h:"#A99BB0",n:"Lavanda polvo"}],
      avoid:[C("#000000","Negro puro"),C("#FF7A29","Naranja brillante"),C("#FFFFFF","Blanco puro")] },

    "otono-suave": { family:"otono", famColor:"#8a4014", name:"Otoño Suave", meta:"Cálida y apagada — la más discreta de las cálidas.",
      metaphor:"Eres un bosque en octubre: cálido, terroso, nunca estridente.",
      palette:[C("#9CAF88","Verde salvia"),C("#C9A375","Camel suave"),C("#B25D4C","Terracota apagada","lip"),C("#A99A6B","Caqui"),C("#8A7B6C","Marrón topo"),C("#C9A94A","Mostaza suave"),C("#7D8C55","Verde oliva"),C("#D9C4A3","Beige cálido"),C("#EFE3CC","Crema","neutral"),C("#8A5A5C","Ciruela cálida","accent"),C("#B8935A","Dorado mate","metal"),C("#7C6A4E","Bronce tierra")],
      stars:["#9CAF88","#B25D4C","#C9A375","#C9A94A","#8A7B6C"],
      denim:{h:"#4a3f34", n:"Denim café oscuro"},
      baseSet:[{h:"#EFE3CC",n:"Crema"},{h:"#D9C4A3",n:"Beige cálido"},{h:"#B8935A",n:"Dorado mate"}],
      accentSet:[{h:"#8A5A5C",n:"Ciruela cálida"},{h:"#B25D4C",n:"Terracota apagada"},{h:"#C9A94A",n:"Mostaza suave"}],
      avoid:[C("#000000","Negro puro"),C("#E8117F","Fucsia"),C("#1E5AA8","Azul frío puro")] },

    "otono-calido": { family:"otono", famColor:"#8a4014", name:"Otoño Cálido", meta:"El corazón de la familia otoño: cálida y terrosa.",
      metaphor:"Eres el color exacto de las hojas cuando cambian: tierra, fuego y cosecha.",
      palette:[C("#D2691E","Naranja calabaza"),C("#C99A2E","Mostaza"),C("#556B2F","Verde bosque"),C("#B5522E","Terracota","lip"),C("#6F4E37","Marrón chocolate"),C("#B8860B","Dorado tostado"),C("#A0361F","Rojo ladrillo","accent"),C("#4A5D23","Verde oliva profundo"),C("#C9A671","Beige tostado"),C("#3E7A73","Turquesa apagado"),C("#EFE0C3","Crema hueso","neutral"),C("#8C6239","Bronce","metal")],
      stars:["#6F4E37","#C99A2E","#556B2F","#C9A671","#B8860B"],
      denim:{h:"#4a3f34", n:"Denim café oscuro"},
      baseSet:[{h:"#EFE0C3",n:"Crema hueso"},{h:"#C9A671",n:"Beige tostado"},{h:"#8C6239",n:"Bronce"}],
      accentSet:[{h:"#A0361F",n:"Rojo ladrillo"},{h:"#B5522E",n:"Terracota"},{h:"#B8860B",n:"Dorado tostado"}],
      avoid:[C("#E8B4C0","Rosa frío pastel"),C("#FFFFFF","Blanco puro"),C("#A9C6E8","Azul hielo")] },

    "otono-profundo": { family:"otono", famColor:"#8a4014", name:"Otoño Profundo", meta:"Cálida e intensa — el último color antes del invierno.",
      metaphor:"Eres el último color antes del invierno: rico, con peso, inolvidable.",
      palette:[C("#4A3728","Marrón café"),C("#6B1E2B","Vino tinto","lip"),C("#2F4023","Verde bosque oscuro"),C("#B5451B","Naranja quemado","accent"),C("#A67C1E","Mostaza oscura"),C("#4E2A3A","Ciruela oscura"),C("#9C4A2E","Terracota profunda"),C("#3A4520","Verde oliva oscuro"),C("#8A6A1F","Dorado oscuro","metal"),C("#1F1A14","Negro cálido","neutral"),C("#A98F6D","Beige oscuro"),C("#245E58","Turquesa oscuro")],
      stars:["#6B1E2B","#4A3728","#2F4023","#9C4A2E","#A98F6D"],
      denim:{h:"#241d18", n:"Denim negro con base café"},
      baseSet:[{h:"#1F1A14",n:"Negro cálido"},{h:"#A98F6D",n:"Beige oscuro"},{h:"#8A6A1F",n:"Dorado oscuro"}],
      accentSet:[{h:"#B5451B",n:"Naranja quemado"},{h:"#6B1E2B",n:"Vino tinto"},{h:"#9C4A2E",n:"Terracota profunda"}],
      avoid:[C("#F5D5DC","Pastel rosa"),C("#B7BEC4","Gris plata frío"),C("#FFFFFF","Blanco puro")] },

    "invierno-frio": { family:"invierno", famColor:"#35407a", name:"Invierno Frío", meta:"El corazón de la familia invierno: fría y nítida.",
      metaphor:"Eres una noche de estrellas: nítida, contrastada, sin mezcla.",
      palette:[C("#0B0B0F","Negro azabache","neutral"),C("#FFFFFF","Blanco puro"),C("#1E3A8A","Azul rey"),C("#C2185B","Fucsia frío","lip"),C("#00695C","Esmeralda"),C("#D0021B","Rojo verdadero","accent"),C("#5B21B6","Morado real"),C("#A9C6E8","Azul hielo"),C("#37474F","Gris carbón"),C("#E91E8C","Rosa frío intenso"),C("#00838F","Turquesa frío"),C("#C0C0C0","Plata","metal")],
      stars:["#0B0B0F","#1E3A8A","#00695C","#FFFFFF","#37474F"],
      denim:{h:"#0e1a33", n:"Denim negro-azulado intenso"},
      baseSet:[{h:"#0B0B0F",n:"Negro azabache"},{h:"#37474F",n:"Gris carbón"},{h:"#C0C0C0",n:"Plata"}],
      accentSet:[{h:"#D0021B",n:"Rojo verdadero"},{h:"#C2185B",n:"Fucsia frío"},{h:"#1E3A8A",n:"Azul rey"}],
      avoid:[C("#E8590C","Naranja"),C("#D9A066","Camel"),C("#C99A2E","Mostaza")] },

    "invierno-profundo": { family:"invierno", famColor:"#35407a", name:"Invierno Profundo", meta:"Fría e intensa — la medianoche misma.",
      metaphor:"Eres la medianoche: profunda, dramática, sin disculpas.",
      palette:[C("#000000","Negro puro","neutral"),C("#4A1030","Vino profundo","lip"),C("#0D1B4C","Azul medianoche"),C("#0B3D2E","Verde botella"),C("#3B0764","Morado oscuro"),C("#7A0C1E","Rojo oscuro","accent"),C("#263238","Gris grafito"),C("#9C1157","Fucsia profundo"),C("#00473E","Esmeralda oscura"),C("#F5F5F5","Blanco frío"),C("#1B2A6B","Azul zafiro"),C("#8A8F94","Plata oscura","metal")],
      stars:["#4A1030","#0D1B4C","#0B3D2E","#3B0764","#263238"],
      denim:{h:"#0e1a33", n:"Denim negro-azulado intenso"},
      baseSet:[{h:"#000000",n:"Negro puro"},{h:"#263238",n:"Gris grafito"},{h:"#8A8F94",n:"Plata oscura"}],
      accentSet:[{h:"#7A0C1E",n:"Rojo oscuro"},{h:"#4A1030",n:"Vino profundo"},{h:"#1B2A6B",n:"Azul zafiro"}],
      avoid:[C("#FFC4B0","Pastel durazno"),C("#E8C39E","Camel claro"),C("#D9C4A3","Beige")] },

    "invierno-brillante": { family:"invierno", famColor:"#35407a", name:"Invierno Brillante", meta:"Fría y clara — un cristal de hielo bajo el sol.",
      metaphor:"Eres un cristal de hielo bajo el sol: fría, pero deslumbrante.",
      palette:[C("#FFFFFF","Blanco puro","neutral"),C("#0B0B0F","Negro"),C("#FF1493","Fucsia eléctrico","lip"),C("#0047AB","Azul cobalto"),C("#00A86B","Verde esmeralda"),C("#E8112D","Rojo verdadero","accent"),C("#F5F500","Amarillo limón frío"),C("#7B2FF7","Violeta"),C("#00CED1","Turquesa brillante"),C("#FF3CA5","Rosa chicle"),C("#C7CDD1","Plata","metal"),C("#7FDBFF","Azul hielo brillante")],
      stars:["#0047AB","#00A86B","#00CED1","#C7CDD1","#7FDBFF"],
      denim:{h:"#0e1a33", n:"Denim negro-azulado, líneas limpias"},
      baseSet:[{h:"#FFFFFF",n:"Blanco puro"},{h:"#0B0B0F",n:"Negro"},{h:"#C7CDD1",n:"Plata"}],
      accentSet:[{h:"#E8112D",n:"Rojo verdadero"},{h:"#FF1493",n:"Fucsia eléctrico"},{h:"#0047AB",n:"Azul cobalto"}],
      avoid:[C("#6F4E37","Marrón"),C("#C99A2E","Mostaza"),C("#D9C4A3","Beige")] }
  };

  var FAM_META = {
    primavera:{ label:"Familia primavera", icon:'<path d="M12 3v3M12 18v3M4.2 4.2l2.1 2.1M17.7 17.7l2.1 2.1M3 12h3M18 12h3M4.2 19.8l2.1-2.1M17.7 6.3l2.1-2.1"/><circle cx="12" cy="12" r="4"/>' },
    verano:{ label:"Familia verano", icon:'<path d="M3 15c2-2 4-2 6 0s4 2 6 0 4-2 6 0M3 19c2-2 4-2 6 0s4 2 6 0 4-2 6 0"/><circle cx="12" cy="7" r="3.4"/>' },
    otono:{ label:"Familia otoño", icon:'<path d="M12 2c3 3 5 6 5 9a5 5 0 0 1-10 0c0-3 2-6 5-9Z"/><path d="M12 13v9"/>' },
    invierno:{ label:"Familia invierno", icon:'<path d="M12 2v20M4.5 6.5l15 11M19.5 6.5l-15 11"/>' }
  };

  /* ============ DATA: CELEBRITIES ============ */
  /* 👉 Estos son nombres reales, comúnmente citados en guías de análisis de color
     por estación (no es una confirmación oficial de la persona, solo un ejemplo
     de referencia usado en la industria). Busca una foto para cada uno y pega la
     URL en "img" — mientras esté vacío, se muestra un círculo con las iniciales
     del nombre en el color de la estación.
     Ejemplo: {name:"Nombre Apellido", img:"https://skshop.com.ec/modules/skcourse/views/img/celebs/invierno-brillante-1.jpg"}
     Puedes agregar, quitar o reemplazar personas libremente. Si el arreglo queda
     vacío, la sección de celebridades no se muestra para esa estación. */
  var CELEBS = {
    "primavera-clara": [ {name:"Taylor Swift", img:""}, {name:"Nicole Kidman", img:""}, {name:"Goldie Hawn", img:""}, {name:"Kim Soo-hyun", img:""} ],
    "primavera-calida": [ {name:"Blake Lively", img:""}, {name:"Amy Adams", img:""}, {name:"Jessica Chastain", img:""}, {name:"Príncipe Harry", img:""} ],
    "primavera-brillante": [ {name:"Zac Efron", img:""}, {name:"Damian Lewis", img:""}, {name:"John Boyega", img:""} ],
    "verano-claro": [ {name:"Daniel Craig", img:""}, {name:"Emily Blunt", img:""}, {name:"Michael Ealy", img:""} ],
    "verano-frio": [ {name:"Natalie Portman", img:""}, {name:"Kate Middleton", img:""}, {name:"Olivia Wilde", img:""}, {name:"Caitriona Balfe", img:""} ],
    "verano-suave": [ {name:"Joey King", img:""}, {name:"Jennifer Aniston", img:""}, {name:"Emilia Clarke", img:""}, {name:"Zoe Saldaña", img:""} ],
    "otono-suave": [ {name:"Kate Winslet", img:""}, {name:"Thandiwe Newton", img:""}, {name:"Elizabeth Olsen", img:""}, {name:"Drew Barrymore", img:""} ],
    "otono-calido": [ {name:"Lindsay Lohan", img:""}, {name:"Beyoncé", img:""}, {name:"Jennifer Lopez", img:""} ],
    "otono-profundo": [ {name:"Zendaya", img:""}, {name:"Halle Berry", img:""}, {name:"Javier Bardem", img:""}, {name:"Rami Malek", img:""} ],
    "invierno-frio": [ {name:"Anne Hathaway", img:""}, {name:"Liv Tyler", img:""}, {name:"Courteney Cox", img:""}, {name:"Lucy Liu", img:""} ],
    "invierno-profundo": [ {name:"Salma Hayek", img:""}, {name:"Viola Davis", img:""}, {name:"Lupita Nyong'o", img:""} ],
    "invierno-brillante": [ {name:"Katy Perry", img:""}, {name:"Zooey Deschanel", img:""}, {name:"Benedict Cumberbatch", img:""}, {name:"Lee Byung-hun", img:""} ]
  };

  function initialsOf(name){
    return name.trim().split(/\s+/).slice(0,2).map(function(w){ return w.charAt(0).toUpperCase(); }).join("");
  }

  /* ============ BLOOM: generative color composition (no photography) ============ */
  function renderBloom(containerId, colors){
    var el = document.getElementById(containerId);
    if(!el) return;
    el.innerHTML = "";
    var n = colors.length;
    // soft blurred background blobs, golden-angle spiral distribution
    for(var i=0;i<n;i++){
      var angle = i * 137.508 * Math.PI/180;
      var radius = 6 + (i/n) * 34;
      var cx = 50 + Math.cos(angle) * radius;
      var cy = 50 + Math.sin(angle) * radius;
      var size = 34 + (i % 4) * 12;
      var b = document.createElement("div");
      b.className = "bloom-blob";
      b.style.left = cx + "%";
      b.style.top = cy + "%";
      b.style.width = size + "%";
      b.style.height = size + "%";
      b.style.transform = "translate(-50%,-50%)";
      b.style.background = colors[i];
      b.style.opacity = .5 + (i % 3) * .12;
      b.style.filter = "blur(20px)";
      el.appendChild(b);
    }
    // crisp foreground cluster (bouquet), fewer, tighter
    var cluster = colors.slice(0, Math.min(6, n));
    cluster.forEach(function(hex, i){
      var ang = (i / cluster.length) * Math.PI * 2 + 0.6;
      var r = 15 + (i % 2) * 8;
      var cx = 50 + Math.cos(ang) * r;
      var cy = 56 + Math.sin(ang) * r * .7;
      var size = 15 - i * 0.6;
      var d = document.createElement("div");
      d.className = "bloom-dot";
      d.style.left = cx + "%";
      d.style.top = cy + "%";
      d.style.width = size + "%";
      d.style.height = size + "%";
      d.style.transform = "translate(-50%,-50%)";
      d.style.background = hex;
      d.style.zIndex = 10 - i;
      el.appendChild(d);
    });
  }

  /* ============ STATE ============ */
  var idx = 0;
  var answers = [];
  var scores = { subtono:0, valor:0, intensidad:0 };

  var screens = {};
  document.querySelectorAll(".screen").forEach(function(s){ screens[s.dataset.screen] = s; });
  function show(name){
    Object.keys(screens).forEach(function(k){ screens[k].classList.toggle("active", k===name); });
    document.getElementById("fan").hidden = (name!=="quiz");
  }

  /* intro bloom: one representative color from each of the 12 seasons */
  var INTRO_BLOOM_COLORS = Object.keys(SEASONS).map(function(k){ return SEASONS[k].stars[0]; });
  renderBloom("bloom-intro", INTRO_BLOOM_COLORS);

  /* ============ QUIZ RENDER ============ */
  var fanEls = document.querySelectorAll("#fan i");

  function renderQuestion(){
    var q = QUESTIONS[idx];
    document.getElementById("step-label").textContent = STEP_NAMES[q.step];
    document.getElementById("q-count").textContent = "Pregunta " + (idx+1) + " de " + QUESTIONS.length;
    document.getElementById("axis-hint").textContent = q.hint;
    document.getElementById("q-text").textContent = q.text;
    document.getElementById("back-btn").style.visibility = idx===0 ? "hidden" : "visible";

    fanEls.forEach(function(el){
      var i = +el.dataset.i;
      el.classList.toggle("done", i < q.step);
      el.classList.toggle("active", i === q.step);
    });

    var wrap = document.getElementById("q-options");
    wrap.innerHTML = "";
    q.options.forEach(function(opt){
      var b = document.createElement("button");
      b.className = "opt";
      var sw = document.createElement("span");
      sw.className = "swatch " + (opt.sw.type==="split"?"split":opt.sw.type==="dots"?"dots":"");
      sw.style.setProperty("--c1", opt.sw.c1);
      if(opt.sw.c2) sw.style.setProperty("--c2", opt.sw.c2);
      if(opt.sw.type==="solid") sw.style.background = opt.sw.c1;
      var lbl = document.createElement("span");
      lbl.className = "lbl";
      lbl.textContent = opt.label;
      if(opt.small){ var s = document.createElement("small"); s.textContent = opt.small; lbl.appendChild(s); }
      b.appendChild(sw); b.appendChild(lbl);
      b.addEventListener("click", function(){ choose(opt); });
      wrap.appendChild(b);
    });

    refreshAxisBars();
  }

  function refreshAxisBars(){
    setBar("ax-subtono", scores.subtono, 8);
    setBar("ax-valor", scores.valor, 8);
    setBar("ax-intensidad", scores.intensidad, 8);
  }
  function setBar(id, value, max){
    var pct = 50 + (value/max)*50;
    pct = Math.max(4, Math.min(96, pct));
    var el = document.getElementById(id);
    el.style.transform = "scaleX(" + (pct/100) + ")";
  }

  function choose(opt){
    var q = QUESTIONS[idx];
    scores[q.axis] += opt.d;
    answers[idx] = opt;
    if(idx < QUESTIONS.length-1){ idx++; renderQuestion(); }
    else { runReveal(); }
  }

  document.getElementById("back-btn").addEventListener("click", function(){
    if(idx>0){
      idx--;
      recomputeScores();
      renderQuestion();
    }
  });

  function recomputeScores(){
    scores = { subtono:0, valor:0, intensidad:0 };
    for(var i=0;i<idx;i++){
      if(answers[i]){ scores[QUESTIONS[i].axis] += answers[i].d; }
    }
  }

  document.getElementById("start-btn").addEventListener("click", function(){
    idx = 0; answers = []; scores = { subtono:0, valor:0, intensidad:0 };
    show("quiz");
    renderQuestion();
  });

  /* ============ SCORING -> SEASON ============ */
  function computeSeason(){
    var s = scores.subtono, v = scores.valor, i = scores.intensidad;
    var warm = s >= 0;
    var family;
    if(warm){
      if(v < -1) family = "primavera";
      else if(v > 1) family = "otono";
      else family = (i >= 0) ? "primavera" : "otono";
    } else {
      if(v < -1) family = "verano";
      else if(v > 1) family = "invierno";
      else family = (i >= 0) ? "invierno" : "verano";
    }
    var sub;
    if(family === "primavera"){
      if(v <= -3) sub = "primavera-clara";
      else if(i >= 3) sub = "primavera-brillante";
      else sub = "primavera-calida";
    } else if(family === "otono"){
      if(v >= 3) sub = "otono-profundo";
      else if(i <= -3) sub = "otono-suave";
      else sub = "otono-calido";
    } else if(family === "verano"){
      if(v <= -3) sub = "verano-claro";
      else if(i <= -3) sub = "verano-suave";
      else sub = "verano-frio";
    } else {
      if(v >= 3) sub = "invierno-profundo";
      else if(i >= 3) sub = "invierno-brillante";
      else sub = "invierno-frio";
    }
    return sub;
  }

  function axisLabel(axis, val){
    if(axis==="subtono"){
      if(val>=3) return "Muy cálido";
      if(val>=1) return "Cálido";
      if(val<=-3) return "Muy frío";
      if(val<=-1) return "Frío";
      return "Neutro";
    }
    if(axis==="valor"){
      if(val<=-3) return "Muy claro";
      if(val<=-1) return "Claro";
      if(val>=3) return "Muy profundo";
      if(val>=1) return "Profundo";
      return "Medio";
    }
    if(val<=-3) return "Muy suave";
    if(val<=-1) return "Suave";
    if(val>=3) return "Muy brillante";
    if(val>=1) return "Brillante";
    return "Equilibrado";
  }

  /* ============ REVEAL + RESULT ============ */
  var revealMsgs = ["mezclando tus pistas…","comparando con las 12 estaciones…","afinando el tono exacto…"];
  function runReveal(){
    show("reveal");
    var i = 0;
    var el = document.getElementById("reveal-text");
    el.textContent = revealMsgs[0];
    var t = setInterval(function(){
      i++;
      if(i < revealMsgs.length){ el.textContent = revealMsgs[i]; }
    }, 550);
    setTimeout(function(){
      clearInterval(t);
      renderResult(computeSeason());
      show("result");
    }, 1700);
  }

  function hexToRgb(h){ h=h.replace('#',''); return [parseInt(h.substr(0,2),16),parseInt(h.substr(2,2),16),parseInt(h.substr(4,2),16)]; }
  function luminance(h){ var c=hexToRgb(h).map(function(v){ v/=255; return v<=.03928? v/12.92 : Math.pow((v+.055)/1.055,2.4); }); return .2126*c[0]+.7152*c[1]+.0722*c[2]; }
  function textOn(h){ return luminance(h) > .42 ? "#241e1a" : "#faf5ec"; }

  function renderResult(seasonId){
    var s = SEASONS[seasonId];

    var famTag = document.getElementById("fam-tag");
    famTag.style.setProperty("--fam-color", s.famColor);
    famTag.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke-width="1.7">'+FAM_META[s.family].icon+'</svg>' + FAM_META[s.family].label;

    document.getElementById("result-name").style.setProperty("--fam-color", s.famColor);
    document.getElementById("result-name").textContent = s.name;
    document.getElementById("result-meta").innerHTML = '<strong>'+s.meta+'</strong> — ' + s.metaphor;

    renderBloom("bloom-result", s.palette.map(function(p){return p.h;}));

    // axis summary
    var ax = document.getElementById("axis-summary");
    var rows = [
      ["Subtono", axisLabel("subtono",scores.subtono), "Cálido = dorado y terroso · Frío = rosado y plateado"],
      ["Claridad", axisLabel("valor",scores.valor), "Claro = luminoso y ligero · Profundo = intenso y oscuro"],
      ["Intensidad", axisLabel("intensidad",scores.intensidad), "Brillante = vívido y nítido · Suave = apagado y mezclado"]
    ];
    ax.innerHTML = rows.map(function(r){
      return '<div class="axis-cell"><h4>'+r[0]+'</h4><p>'+r[1]+'</p><span>'+r[2]+'</span></div>';
    }).join("");

    document.getElementById("why-text").innerHTML = 'Así llegamos aquí: tus respuestas dieron un subtono <strong>'+axisLabel("subtono",scores.subtono).toLowerCase()+'</strong>, una claridad <strong>'+axisLabel("valor",scores.valor).toLowerCase()+'</strong> y una intensidad <strong>'+axisLabel("intensidad",scores.intensidad).toLowerCase()+'</strong>. Esa combinación exacta es lo que en colorimetría se conoce como <strong>'+s.name+'</strong>.';

    // stars
    var starsRow = document.getElementById("stars-row");
    starsRow.innerHTML = s.stars.map(function(hex){
      var entry = s.palette.filter(function(p){return p.h===hex;})[0] || {n:"", h:hex};
      return '<div class="star-chip"><div class="sw" style="background:'+hex+'"></div><div class="name">'+entry.n+'</div><div class="hex">'+hex+'</div></div>';
    }).join("");

    // full palette
    var grid = document.getElementById("palette-grid");
    grid.innerHTML = s.palette.map(function(p){
      return '<div class="swatch-cell" style="background:'+p.h+'"><div class="tip" style="color:'+textOn(p.h)+'">'+p.n+' · '+p.h+'</div></div>';
    }).join("");

    // guide (3 colors per card: base + main garment color + accent, each rotating per category)
    var neutral = s.palette.filter(function(p){return p.role==="neutral";})[0] || s.palette[7];
    var metal = s.palette.filter(function(p){return p.role==="metal";})[0] || s.palette[s.palette.length-1];
    var lip = s.palette.filter(function(p){return p.role==="lip";})[0] || s.palette[0];
    var baseSet = s.baseSet || [neutral];
    var accentSetArr = s.accentSet || [neutral];
    var st = s.stars;
    function byHex(h){ return s.palette.filter(function(p){return p.h===h;})[0] || {n:"",h:h}; }

    var guideItems = [
      { cat:"Tu base perfecta", hex:neutral.h, name:neutral.n, tip:"El blanco, negro o crudo que más se parece a tu propio tono de piel — por eso no compite con tu cara." },
      { cat:"Blusas y tops", hex:st[0], name:byHex(st[0]).n, tip:"Cerca del rostro es donde más se nota tu estación. Este color despierta tu piel en segundos." },
      { cat:"Pantalón o falda", hex:st[1], name:byHex(st[1]).n, tip:"No necesita estar pegado a la cara para ayudarte — crea una base que combina con toda tu paleta." },
      { cat:"Vestido de ocasión", hex:st[2], name:byHex(st[2]).n, tip:"Para una fecha especial, este es el color que más se recordará de ti." },
      { cat:"Denim ideal", hex:s.denim.h, name:s.denim.n, tip:"El lavado de mezclilla que mejor conversa con el resto de tu paleta." },
      { cat:"Abrigo o blazer", hex:st[3], name:byHex(st[3]).n, tip:"Una prenda grande en tu color multiplica el efecto — se nota incluso de lejos." },
      { cat:"Bolso y zapatos", hex:st[4], name:byHex(st[4]).n, tip:"Los accesorios en tu color redondean el look sin que tengas que pensarlo." },
      { cat:"Tu metal", hex:metal.h, name:metal.n, tip:"El metal de tus aretes, cadenas o reloj que mejor combina con tu subtono." },
      { cat:"Tu labial", hex:lip.h, name:lip.n, tip:"El color de labios que más se acerca al tono natural de tus labios y mejillas — nunca falla." }
    ];
    document.getElementById("guide-grid").innerHTML = guideItems.map(function(g,i){
      var base = baseSet[i % baseSet.length];
      var accent = accentSetArr[i % accentSetArr.length];
      return '<div class="guide-card">'
        + '<h4>'+g.cat+'</h4>'
        + '<div class="tri-swatch">'
          + '<div class="tri-item"><div class="sw" style="background:'+base.h+'"></div><span>Base · '+base.n+'</span></div>'
          + '<div class="tri-item"><div class="sw" style="background:'+g.hex+'"></div><span>Principal · '+g.name+'</span></div>'
          + '<div class="tri-item"><div class="sw" style="background:'+accent.h+'"></div><span>Acento · '+accent.n+'</span></div>'
        + '</div>'
        + '<p class="tip">'+g.tip+'</p>'
        + '</div>';
    }).join("");

    // avoid
    document.getElementById("avoid-row").innerHTML = s.avoid.map(function(a){
      return '<div class="avoid-chip"><div class="sw" style="background:'+a.h+'"></div><span>'+a.n+'</span></div>';
    }).join("");

    // celebrities (name required; img optional — falls back to an initials avatar)
    var celebSection = document.getElementById("celeb-section");
    var celebRow = document.getElementById("celeb-row");
    celebRow.style.setProperty("--fam-color", s.famColor);
    var celebList = (CELEBS[seasonId] || []).filter(function(c){ return c && c.name; });
    if(celebList.length){
      celebSection.hidden = false;
      celebRow.innerHTML = celebList.map(function(c){
        var imgTag = c.img ? '<img class="photo" src="'+c.img+'" alt="'+c.name+'" loading="lazy" onerror="this.style.display=\'none\'">' : '';
        return '<div class="celeb-card"><div class="photo-wrap"><div class="photo placeholder">'+initialsOf(c.name)+'</div>'+imgTag+'</div><span class="name">'+c.name+'</span></div>';
      }).join("");
    } else {
      celebSection.hidden = true;
      celebRow.innerHTML = "";
    }

    // copy result
    var copyBtn = document.getElementById("copy-btn");
    copyBtn.onclick = function(){
      var text = "Mi estación de color es " + s.name + " (" + FAM_META[s.family].label + ").\nColores estrella: " + s.stars.join(", ") + "\nDescubre la tuya en este mismo test.";
      if(navigator.clipboard && navigator.clipboard.writeText){
        navigator.clipboard.writeText(text).then(function(){
          var m = document.getElementById("copied-msg");
          m.classList.add("show");
          setTimeout(function(){ m.classList.remove("show"); }, 1800);
        });
      }
    };
  }

  document.getElementById("restart-btn").addEventListener("click", function(){
    idx = 0; answers = []; scores = { subtono:0, valor:0, intensidad:0 };
    show("intro");
    window.scrollTo({top:0, behavior:"smooth"});
  });

})();
</script>
        {/literal}
    </div>
{else}
<div class="container" style="padding: 60px 0;">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-12 col-xl-12">

            <h1 style="text-align: center; margin-bottom: 32px;">{$product_name|escape:'html'}</h1>

            {if $expired}
                {* ======================== EXPIRED ======================== *}
                <div style="text-align:center; padding: 40px; background: #fff3f3; border-radius: 10px;">
                    <h3 style="color: #cc0000;">Tu acceso a "{$product_name|escape:'html'}" ha expirado</h3>
                    <p style="color: #666;">Tu enlace de acceso era válido hasta {$expires_at}.</p>
                    <a href="{$link->getProductLink($product_id)}" class="btn btn-primary">
                        Renovar acceso
                    </a>
                </div>

            {elseif $show_modules}
                {* ======================== MODULES LIST ======================== *}
                <div style="max-width: 700px; margin: 0 auto;">

                    <p style="text-align: center; color: #999; font-size: 13px; margin-bottom: 32px;">
                        Acceso válido hasta: {$expires_at}
                    </p>

                    {if $bonus_url}
                        <a href="{$bonus_url|escape:'html'}" style="
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            gap: 10px;
                            margin-bottom: 24px;
                            padding: 18px 24px;
                            background: linear-gradient(135deg, #C9A96E, #e8c896);
                            border-radius: 10px;
                            text-decoration: none;
                            color: #ffffff;
                            font-weight: 600;
                            font-size: 15px;
                            box-shadow: 0 4px 14px rgba(201,169,110,0.35);
                        ">
                            🎁 Reclama tu regalo: Detective de tu Color
                        </a>
                    {/if}

                    <div style="display: flex; flex-direction: column; gap: 12px;">
                        {foreach $modules as $module}
                            <a href="{$module.url|escape:'html'}" style="
                                display: flex;
                                align-items: center;
                                padding: 20px 24px;
                                background: #ffffff;
                                border: 1px solid #eeeeee;
                                border-radius: 10px;
                                text-decoration: none;
                                color: #1a1a1a;
                                box-shadow: 0 2px 8px rgba(0,0,0,0.06);
                                transition: box-shadow 0.2s ease;
                            "
                            onmouseover="this.style.boxShadow='0 4px 16px rgba(0,0,0,0.12)'"
                            onmouseout="this.style.boxShadow='0 2px 8px rgba(0,0,0,0.06)'">
                                <div style="
                                    width: 40px;
                                    height: 40px;
                                    border-radius: 50%;
                                    background: #C9A96E;
                                    color: #ffffff;
                                    display: flex;
                                    align-items: center;
                                    justify-content: center;
                                    font-weight: bold;
                                    font-size: 16px;
                                    flex-shrink: 0;
                                    margin-right: 16px;
                                ">
                                    {$module.id}
                                </div>
                                <div>
                                    <p style="margin: 0; font-size: 15px; font-weight: 600;">
                                        {$module.title|escape:'html'}
                                    </p>
                                    <p style="margin: 4px 0 0; font-size: 13px; color: #999;">
                                        {if $module.description}
                                            {$module.description|escape:'html'|truncate:80:'...'}
                                        {else}
                                            Módulo {$module.id}
                                        {/if}
                                    </p>
                                </div>
                                <div style="margin-left: auto; color: #C9A96E; font-size: 20px;">▶</div>
                            </a>
                        {/foreach}
                    </div>

                    <p style="text-align: center; margin-top: 32px; color: #999; font-size: 13px;">
                        ⚠️ Este contenido es exclusivo para clientes. Por favor no compartas este enlace.
                    </p>
                </div>

            {else}
                {* ======================== VIDEO PLAYER ======================== *}
                <div style="max-width: 70%; margin: 0 auto;">

                    {* Back + progress *}
                    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 16px;">
                        <a href="{$course_url|escape:'html'}" style="color: #C9A96E; font-size: 14px; text-decoration: none;">
                            ← Volver a módulos
                        </a>
                        <span style="color: #999; font-size: 13px;">
                            Módulo {$current_module} de {$total_modules}
                        </span>
                    </div>

                    {* Module title *}
                    <h2 style="font-size: 20px; margin-bottom: 16px; color: #1a1a1a;">
                        {$module_title|escape:'html'}
                    </h2>

                    {* Video player *}
                    <video
                        controls
                        controlsList="nodownload"
                        oncontextmenu="return false;"
                        style="width:100%; aspect-ratio:16/9; border-radius:10px; box-shadow: 0 8px 30px rgba(0,0,0,0.2);">
                        <source src="{$video_url|escape:'html'}" type="video/mp4">
                    </video>

                    {* Module description *}
                    {if $module_description}
                        <div style="
                            margin-top: 24px;
                            padding: 20px 24px;
                            background: #f9f9f9;
                            border-radius: 10px;
                            border-left: 4px solid #C9A96E;
                        ">
                            <h3 style="font-size: 15px; font-weight: 600; margin: 0 0 8px; color: #1a1a1a;">
                                Sobre este módulo
                            </h3>
                            <p style="margin: 0; color: #555; font-size: 14px; line-height: 1.7;">
                                {$module_description|escape:'html'}
                            </p>
                        </div>
                    {/if}

                    {* Prev / Next navigation *}
                    <div style="display: flex; justify-content: space-between; margin-top: 20px; gap: 12px;">
                        {if $prev_url}
                            <a href="{$prev_url|escape:'html'}" class="btn btn-default" style="flex: 1; text-align: center;">
                                ← Módulo anterior
                            </a>
                        {else}
                            <div style="flex: 1;"></div>
                        {/if}

                        {if $next_url}
                            <a href="{$next_url|escape:'html'}" class="btn btn-primary" style="flex: 1; text-align: center; background: #C9A96E; border-color: #C9A96E;">
                                Siguiente módulo →
                            </a>
                        {else}
                            <div style="flex: 1; text-align: center; padding: 10px; background: #f9f9f9; border-radius: 6px; color: #999; font-size: 13px;">
                                ✅ Has completado el curso
                            </div>
                        {/if}
                    </div>

                    <p style="text-align:right; color:#999; font-size:12px; margin-top:16px;">
                        Acceso válido hasta: {$expires_at}
                    </p>

                    <p style="text-align: center; margin-top: 12px; color: #999; font-size: 13px;">
                        ⚠️ Este contenido es exclusivo para clientes. Por favor no compartas este enlace.
                    </p>
                </div>
            {/if}

        </div>
    </div>
</div>
{/if}
{/block}
