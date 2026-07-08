{block name='breadcrumb'}{/block}

{block name='content'}
<style>
  .sk-landing * { box-sizing: border-box; margin: 0; padding: 0; }
  .sk-landing {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    color: #1a1a1a;
    line-height: 1.7;
    --gold: #C9A96E;
    --gold-dark: #a8853f;
    --black: #1a1a1a;
    --soft: #f7f4f0;
    --white: #ffffff;
    --gray: #666666;
    --border: #e8e0d5;
  }
  .sk-btn {
    display: inline-block; background: var(--gold); color: var(--white);
    padding: 18px 48px; border-radius: 4px; font-size: 16px; font-weight: 600;
    letter-spacing: 1px; text-decoration: none; text-transform: uppercase;
    transition: background 0.3s ease, transform 0.2s ease; cursor: pointer; border: none;
  }
  .sk-btn:hover { background: var(--gold-dark); color: var(--white); text-decoration: none; transform: translateY(-2px); }
  .sk-btn-lg { padding: 22px 64px; font-size: 17px; }
  .sk-section { padding: 90px 20px; }
  .sk-section-dark { background: var(--black); color: var(--white); }
  .sk-section-soft { background: var(--soft); }
  .sk-section-white { background: var(--white); }
  .sk-container { max-width: 920px; margin: 0 auto; }
  .sk-eyebrow { font-size: 11px; letter-spacing: 3px; text-transform: uppercase; color: var(--gold); margin-bottom: 16px; display: block; }
  .sk-h1 { font-size: clamp(30px, 5vw, 54px); font-weight: 300; line-height: 1.2; }
  .sk-h2 { font-size: clamp(24px, 4vw, 40px); font-weight: 300; line-height: 1.3; }
  .sk-gold { color: var(--gold); }
  .sk-italic { font-style: italic; }
  .sk-center { text-align: center; }
  .sk-divider { width: 48px; height: 2px; background: var(--gold); margin: 24px auto; }
  .sk-divider-left { width: 48px; height: 2px; background: var(--gold); margin: 24px 0; }
  .sk-hero {
    position: relative; min-height: 90vh;
    display: flex; align-items: center; justify-content: center;
    text-align: center; padding: 100px 20px; overflow: hidden;
    background: var(--black);
  }
  .sk-hero-bg {
    position: absolute; inset: 0;
    background-image: url('https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=1600&q=80');
    background-size: cover; background-position: center top; opacity: 0.25;
  }
  .sk-hero-overlay { position: absolute; inset: 0; background: linear-gradient(to bottom, rgba(26,26,26,0.4) 0%, rgba(26,26,26,0.85) 100%); }
  .sk-hero-content { position: relative; z-index: 2; }
  .sk-hero-subtitle { font-size: clamp(15px, 2.5vw, 19px); color: rgba(255,255,255,0.75); max-width: 620px; margin: 24px auto 40px; line-height: 1.8; }
  .sk-hero-stars { color: var(--gold); font-size: 18px; letter-spacing: 4px; margin-bottom: 12px; }
  .sk-hero-testimonial { font-size: 14px; color: rgba(255,255,255,0.5); font-style: italic; max-width: 480px; margin: 0 auto; }
  .sk-video-wrapper { max-width: 720px; margin: 0 auto; border-radius: 10px; overflow: hidden; box-shadow: 0 24px 60px rgba(0,0,0,0.2); aspect-ratio: 16/9; background: #000; }
  .sk-video-wrapper iframe { width: 100%; height: 100%; border: 0; display: block; }
  .sk-two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: start; }
  @media(max-width:640px){ .sk-two-col { grid-template-columns: 1fr; gap: 40px; } }
  .sk-checklist { list-style: none; }
  .sk-checklist li { padding: 12px 0 12px 32px; position: relative; font-size: 15px; color: var(--gray); border-bottom: 1px solid var(--border); }
  .sk-checklist li:last-child { border-bottom: none; }
  .sk-checklist li::before { content: attr(data-icon); position: absolute; left: 0; }
  .sk-ba-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
  @media(max-width:640px){ .sk-ba-grid { grid-template-columns: 1fr; } }
  .sk-ba-box { padding: 32px; border-radius: 10px; }
  .sk-ba-before { background: #fdf2f2; border-left: 4px solid #e8a0a0; }
  .sk-ba-after  { background: #f5f0e8; border-left: 4px solid var(--gold); }
  .sk-ba-title { font-size: 12px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; margin-bottom: 20px; }
  .sk-ba-before .sk-ba-title { color: #cc6666; }
  .sk-ba-after  .sk-ba-title { color: var(--gold-dark); }
  .sk-ba-box ul { list-style: none; }
  .sk-ba-box ul li { padding: 9px 0; font-size: 15px; color: var(--gray); border-bottom: 1px solid rgba(0,0,0,0.05); }
  .sk-ba-box ul li:last-child { border-bottom: none; }
  .sk-modules { display: flex; flex-direction: column; gap: 16px; }
  .sk-module-item { display: flex; gap: 20px; padding: 24px 28px; background: var(--white); border-radius: 10px; border: 1px solid var(--border); align-items: flex-start; transition: box-shadow 0.2s ease; }
  .sk-module-item:hover { box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
  .sk-module-num { min-width: 48px; height: 48px; background: var(--black); color: var(--gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 16px; flex-shrink: 0; }
  .sk-module-title { font-weight: 600; font-size: 16px; margin-bottom: 6px; color: var(--black); }
  .sk-module-desc { font-size: 14px; color: var(--gray); line-height: 1.6; }
  .sk-includes-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 20px; }
  .sk-include-item { text-align: center; padding: 28px 20px; background: rgba(255,255,255,0.05); border-radius: 8px; border: 1px solid rgba(201,169,110,0.2); transition: border-color 0.2s ease; }
  .sk-include-item:hover { border-color: var(--gold); }
  .sk-include-icon { font-size: 28px; margin-bottom: 12px; }
  .sk-include-text { font-size: 14px; color: rgba(255,255,255,0.65); line-height: 1.5; }
  .sk-instructor-img { width: 220px; height: 280px; border-radius: 8px; object-fit: cover; box-shadow: 0 12px 40px rgba(0,0,0,0.15); }
  .sk-instructor-col { display: grid; grid-template-columns: 220px 1fr; gap: 60px; align-items: center; }
  @media(max-width:640px){ .sk-instructor-col { grid-template-columns: 1fr; } }
  .sk-testimonials { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 24px; }
  .sk-testimonial-card { background: var(--white); border-radius: 10px; padding: 28px; border: 1px solid var(--border); position: relative; }
  .sk-testimonial-card::before { content: '"'; position: absolute; top: 16px; left: 24px; font-size: 60px; color: var(--gold); opacity: 0.3; font-family: Georgia, serif; line-height: 1; }
  .sk-testimonial-text { font-size: 15px; color: var(--gray); line-height: 1.7; margin-bottom: 16px; padding-top: 20px; }
  .sk-testimonial-author { font-size: 13px; font-weight: 600; color: var(--black); }
  .sk-testimonial-stars { color: var(--gold); font-size: 13px; margin-bottom: 8px; }
  .sk-price-box { max-width: 480px; margin: 0 auto; text-align: center; padding: 52px 40px; background: var(--white); border-radius: 12px; box-shadow: 0 8px 40px rgba(0,0,0,0.1); border-top: 4px solid var(--gold); }
  .sk-price-tag { font-size: 72px; font-weight: 300; color: var(--black); line-height: 1; }
  .sk-price-tag sup { font-size: 28px; vertical-align: super; }
  .sk-price-label { font-size: 12px; color: var(--gray); letter-spacing: 2px; text-transform: uppercase; margin-top: 8px; }
  .sk-guarantee { margin-top: 24px; padding: 16px; background: var(--soft); border-radius: 6px; font-size: 13px; color: var(--gray); line-height: 1.6; }
  .sk-closing { position: relative; background: var(--black); color: var(--white); text-align: center; padding: 120px 20px; overflow: hidden; }
  .sk-closing-bg { position: absolute; inset: 0; background-image: url('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=1600&q=80'); background-size: cover; background-position: center; opacity: 0.1; }
  .sk-closing-overlay { position: absolute; inset: 0; background: radial-gradient(ellipse at center, rgba(201,169,110,0.08) 0%, transparent 70%); }
  .sk-closing-content { position: relative; z-index: 2; }
  .sk-closing-lines p { font-size: clamp(18px, 3vw, 30px); font-weight: 300; line-height: 1.7; color: rgba(255,255,255,0.8); }
  .sk-image-strip { height: 340px; background-size: cover; background-position: center 30%; position: relative; }
  .sk-image-strip-overlay { position: absolute; inset: 0; display: flex; align-items: center; padding: 0 60px; }
  .sk-strip-text { color: var(--white); max-width: 480px; }
  .sk-strip-text h3 { font-size: clamp(22px, 3vw, 36px); font-weight: 300; line-height: 1.4; margin-bottom: 16px; }
  .sk-strip-text p { font-size: 16px; color: rgba(255,255,255,0.7); }

  @media (max-width: 640px) {
    .sk-hero { min-height: 100svh; padding: 80px 20px; }
    .sk-btn-lg { padding: 16px 32px; font-size: 15px; }
    .sk-image-strip { height: 240px; }
    .sk-image-strip-overlay { padding: 0 24px; }
    .sk-strip-text h3 { font-size: 22px; }
    .sk-section { padding: 60px 20px; }
    .sk-price-box { padding: 36px 24px; }
    .sk-price-tag { font-size: 52px; }
    .sk-closing { padding: 80px 20px; }
    .sk-instructor-img { width: 100%; height: 260px; }
    .sk-closing-lines p { font-size: 18px; }
    .sk-includes-grid { grid-template-columns: repeat(2, 1fr); }
  }
</style>

<div class="sk-landing">

  {* ══ HERO ══ *}
  <section class="sk-hero">
    <div class="sk-hero-bg"></div>
    <div class="sk-hero-overlay"></div>
    <div class="sk-hero-content sk-container">
      <span class="sk-eyebrow">Curso de Colorimetría · Saruka Rodriguez</span>
      <h1 class="sk-h1" style="color:#fff;">
        Nunca fue falta de estilo.<br>
        <span class="sk-gold sk-italic">Solo nadie te enseñó a encontrar tus colores.</span>
      </h1>
      <p class="sk-hero-subtitle">
        Aprende a identificar tu paleta personal, entender tu identidad cromática y construir un clóset donde todo combine contigo. Más de 2 horas de contenido práctico con ejercicios que aplicarás desde el primer día.
      </p>
      <a href="{$buy_url}" class="sk-btn sk-btn-lg">
        Quiero descubrir mi paleta
      </a>
      <div style="margin-top: 48px;">
        <div class="sk-hero-stars">★★★★★</div>
        <p class="sk-hero-testimonial">
          "Nunca entendí por qué ciertos colores me apagaban hasta que tomé este curso. Ahora compro con criterio y me siento más yo que nunca."<br>
          <strong style="color: rgba(255,255,255,0.6); font-style: normal; font-size: 13px;">— María José, Quito</strong>
        </p>
      </div>
    </div>
  </section>

  {* ══ VIDEO ══ *}
  <section class="sk-section sk-section-soft">
    <div class="sk-container">
      <div class="sk-center" style="margin-bottom: 40px;">
        <span class="sk-eyebrow">Antes de decidir</span>
        <h2 class="sk-h2">Déjame contarte en 2 minutos<br>qué vas a lograr</h2>
        <div class="sk-divider"></div>
      </div>
      <div class="sk-video-wrapper">
        {* Replace with Saruka's real promo video *}
        <iframe src="https://www.youtube.com/embed/2i1jZbuSBIs" allowfullscreen></iframe>
      </div>
      <p style="text-align:center; margin-top: 24px; font-size: 14px; color: var(--gray);">
        Una promesa simple: al terminar este curso vas a vestirte de forma diferente.
      </p>
    </div>
  </section>

  {* ══ IMAGE STRIP 1 ══ *}
  <div class="sk-image-strip" style="background-image: url('https://images.unsplash.com/photo-1512436991641-6745cdb1723f?w=1600&q=80');">
    <div class="sk-image-strip-overlay" style="background: linear-gradient(to right, rgba(26,26,26,0.75) 0%, rgba(26,26,26,0.2) 60%, transparent 100%);">
      <div class="sk-strip-text">
        <h3>El color no es moda.<br>Es identidad.</h3>
        <p>Cuando entiendes tus colores, todo lo demás se vuelve más fácil.</p>
      </div>
    </div>
  </div>

  {* ══ PROBLEMA / PROMESA ══ *}
  <section class="sk-section sk-section-white">
    <div class="sk-container">
      <div class="sk-two-col">
        <div>
          <span class="sk-eyebrow">¿Te identificas?</span>
          <h2 class="sk-h2" style="margin-bottom: 20px;">Si alguna vez has sentido esto…</h2>
          <div class="sk-divider-left"></div>
          <ul class="sk-checklist">
            <li data-icon="✓">Tengo mucha ropa y siento que nunca tengo qué ponerme.</li>
            <li data-icon="✓">Compro prendas que luego nunca vuelvo a usar.</li>
            <li data-icon="✓">Veo outfits increíbles en otras pero en mí no funcionan.</li>
            <li data-icon="✓">No sé qué colores realmente me favorecen.</li>
            <li data-icon="✓">Paso demasiado tiempo decidiendo qué ponerme.</li>
            <li data-icon="✓">Siento que mi imagen no refleja quién soy.</li>
          </ul>
          <p style="margin-top: 24px; font-size: 17px; font-weight: 600;">Entonces este curso fue creado para ti.</p>
        </div>
        <div>
          <span class="sk-eyebrow">Lo que vas a lograr</span>
          <h2 class="sk-h2" style="margin-bottom: 20px;">Vas a salir sabiendo exactamente:</h2>
          <div class="sk-divider-left"></div>
          <ul class="sk-checklist">
            <li data-icon="✓">Qué colores hacen que tu piel se vea más luminosa.</li>
            <li data-icon="✓">Cómo identificar tu subtono de piel.</li>
            <li data-icon="✓">Cómo descubrir tu estación cromática.</li>
            <li data-icon="✓">Cómo crear outfits sin complicarte.</li>
            <li data-icon="✓">Cómo comprar menos y aprovechar más tu clóset.</li>
            <li data-icon="✓">Cómo construir una imagen coherente contigo.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  {* ══ ANTES / DESPUÉS ══ *}
  <section class="sk-section sk-section-soft">
    <div class="sk-container">
      <div class="sk-center" style="margin-bottom: 48px;">
        <span class="sk-eyebrow">El gran cambio</span>
        <h2 class="sk-h2">Una decisión que transforma<br>cómo te ves y cómo te sientes</h2>
        <div class="sk-divider"></div>
      </div>
      <div class="sk-ba-grid">
        <div class="sk-ba-box sk-ba-before">
          <p class="sk-ba-title">Antes del curso</p>
          <ul>
            <li>❌ Comprabas por impulso sin criterio.</li>
            <li>❌ Dudabas frente al espejo cada mañana.</li>
            <li>❌ Copiabas outfits que no te representaban.</li>
            <li>❌ Pensabas que necesitabas más ropa.</li>
            <li>❌ Sentías que algo faltaba, sin saber qué.</li>
          </ul>
        </div>
        <div class="sk-ba-box sk-ba-after">
          <p class="sk-ba-title">Después del curso</p>
          <ul>
            <li>✅ Compras con criterio e intención.</li>
            <li>✅ Sabes exactamente qué te favorece.</li>
            <li>✅ Tu ropa trabaja para ti, no al revés.</li>
            <li>✅ Tu clóset tiene menos pero rinde más.</li>
            <li>✅ Tu imagen refleja quién realmente eres.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  {* ══ IMAGE STRIP 2 ══ *}
  <div class="sk-image-strip" style="background-image: url('https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1600&q=80'); background-position: center 40%;">
    <div class="sk-image-strip-overlay" style="background: linear-gradient(to left, rgba(26,26,26,0.75) 0%, rgba(26,26,26,0.2) 60%, transparent 100%); justify-content: flex-end; padding: 0 60px;">
      <div class="sk-strip-text" style="text-align: right;">
        <h3>Tu clóset ya tiene<br>lo que necesitas.</h3>
        <p>Solo necesitas aprender a verlo diferente.</p>
      </div>
    </div>
  </div>

  {* ══ MÓDULOS ══ *}
  <section class="sk-section sk-section-white">
    <div class="sk-container">
      <div class="sk-center" style="margin-bottom: 48px;">
        <span class="sk-eyebrow">Contenido del curso</span>
        <h2 class="sk-h2">5 módulos.<br>Un método probado.</h2>
        <div class="sk-divider"></div>
        <p style="font-size: 17px; color: var(--gray); max-width: 540px; margin: 0 auto;">
          Cada módulo construye sobre el anterior. Al final tendrás un sistema completo para vestirte con intención.
        </p>
      </div>
      <div class="sk-modules">
        <div class="sk-module-item">
          <div class="sk-module-num">1</div>
          <div>
            <p class="sk-module-title">Descubre por qué unos colores te hacen brillar y otros te apagan.</p>
            <p class="sk-module-desc">Aprenderás la base del color y entenderás cómo influye directamente en la percepción de tu imagen. El punto de partida que nadie te explicó antes.</p>
          </div>
        </div>
        <div class="sk-module-item">
          <div class="sk-module-num">2</div>
          <div>
            <p class="sk-module-title">Aprende a leer tu piel.</p>
            <p class="sk-module-desc">Descubrirás tu subtono, contraste e identidad cromática mediante ejercicios prácticos que puedes hacer desde casa con lo que ya tienes.</p>
          </div>
        </div>
        <div class="sk-module-item">
          <div class="sk-module-num">3</div>
          <div>
            <p class="sk-module-title">Encuentra la paleta que siempre debió acompañarte.</p>
            <p class="sk-module-desc">Identificarás tu estación cromática y dejarás de elegir colores al azar. Por primera vez tendrás un criterio claro para comprar y combinar.</p>
          </div>
        </div>
        <div class="sk-module-item">
          <div class="sk-module-num">4</div>
          <div>
            <p class="sk-module-title">Convierte tu clóset en una herramienta.</p>
            <p class="sk-module-desc">Aplicarás todo lo aprendido para construir outfits con intención usando la ropa que ya tienes. Sin comprar nada nuevo todavía.</p>
          </div>
        </div>
        <div class="sk-module-item">
          <div class="sk-module-num">5</div>
          <div>
            <p class="sk-module-title">Deja de vestirte. Empieza a proyectar.</p>
            <p class="sk-module-desc">Validarás tu transformación y aprenderás cómo mantener un estilo coherente todos los días. Tu imagen, con tu identidad.</p>
          </div>
        </div>
      </div>
      <div style="text-align:center; margin-top: 48px;">
        <a href="{$buy_url}" class="sk-btn sk-btn-lg">Quiero acceder al curso</a>
      </div>
    </div>
  </section>

  {* ══ LO QUE INCLUYE ══ *}
  <section class="sk-section sk-section-dark">
    <div class="sk-container">
      <div class="sk-center" style="margin-bottom: 48px;">
        <span class="sk-eyebrow">Lo que recibes</span>
        <h2 class="sk-h2" style="color:#fff;">Todo lo que necesitas.<br>Nada que sobre.</h2>
        <div class="sk-divider"></div>
        <p style="font-size: 16px; color: rgba(255,255,255,0.6); max-width: 500px; margin: 0 auto;">
          No es un curso donde solo escuchas teoría. Aquí vas a <strong style="color: var(--gold);">hacer, analizar, descubrir y aplicar</strong> desde el primer módulo.
        </p>
      </div>
      <div class="sk-includes-grid">
        <div class="sk-include-item"><div class="sk-include-icon">🎬</div><p class="sk-include-text">Más de 2 horas de clases en video</p></div>
        <div class="sk-include-item"><div class="sk-include-icon">📋</div><p class="sk-include-text">5 módulos paso a paso</p></div>
        <div class="sk-include-item"><div class="sk-include-icon">✏️</div><p class="sk-include-text">Ejercicios prácticos guiados</p></div>
        <div class="sk-include-item"><div class="sk-include-icon">🏠</div><p class="sk-include-text">Talleres para hacer desde casa</p></div>
        <div class="sk-include-item"><div class="sk-include-icon">📄</div><p class="sk-include-text">Plantillas de apoyo descargables</p></div>
        <div class="sk-include-item"><div class="sk-include-icon">📱</div><p class="sk-include-text">Acceso desde cualquier dispositivo</p></div>
      </div>
    </div>
  </section>

  {* ══ SOBRE SARUKA ══ *}
  <section class="sk-section sk-section-soft">
    <div class="sk-container">
      <div class="sk-instructor-col">
        <div>
          {* Replace src with Saruka's real photo: /img/cms/saruka.jpg *}
          <img
            src="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=440&q=80"
            alt="Saruka Rodriguez"
            class="sk-instructor-img"
          >
        </div>
        <div>
          <span class="sk-eyebrow">Tu instructora</span>
          <h2 class="sk-h2" style="margin-bottom: 20px;">Aprende de quien lo vive.</h2>
          <div class="sk-divider-left"></div>
          <p style="font-size: 16px; color: var(--gray); margin-bottom: 16px; line-height: 1.8;">
            Saruka Rodriguez es diseñadora ecuatoriana con presencia en más de 10 países y reconocida por medios internacionales como <strong>HOLA! Revista</strong>. Fundadora de la marca que lleva su nombre, ha construido su carrera alrededor de una convicción: la moda debe ser un reflejo auténtico de quien la lleva.
          </p>
          <p style="font-size: 16px; color: var(--gray); line-height: 1.8;">
            Este curso no es teoría tomada de libros. Es el método que ella misma aplica y enseña para que cada mujer descubra su propia identidad cromática y la convierta en su mayor herramienta de estilo.
          </p>
          <div style="margin-top: 28px; display: flex; gap: 32px;">
            <div>
              <p style="font-size: 28px; font-weight: 300; color: var(--gold);">10+</p>
              <p style="font-size: 12px; color: var(--gray); text-transform: uppercase; letter-spacing: 1px;">Países</p>
            </div>
            <div>
              <p style="font-size: 28px; font-weight: 300; color: var(--gold);">2K+</p>
              <p style="font-size: 12px; color: var(--gray); text-transform: uppercase; letter-spacing: 1px;">Alumnas</p>
            </div>
            <div>
              <p style="font-size: 28px; font-weight: 300; color: var(--gold);">15+</p>
              <p style="font-size: 12px; color: var(--gray); text-transform: uppercase; letter-spacing: 1px;">Años de experiencia</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  {* ══ TESTIMONIOS ══ *}
  <section class="sk-section sk-section-white">
    <div class="sk-container">
      <div class="sk-center" style="margin-bottom: 48px;">
        <span class="sk-eyebrow">Lo que dicen ellas</span>
        <h2 class="sk-h2">Miles de mujeres ya encontraron sus colores.</h2>
        <div class="sk-divider"></div>
      </div>
      <div class="sk-testimonials">
        <div class="sk-testimonial-card">
          <div class="sk-testimonial-stars">★★★★★</div>
          <p class="sk-testimonial-text">Nunca entendí por qué ciertos colores me apagaban hasta que tomé este curso. Ahora compro con criterio y me siento más yo que nunca.</p>
          <p class="sk-testimonial-author">— María José, Quito</p>
        </div>
        <div class="sk-testimonial-card">
          <div class="sk-testimonial-stars">★★★★★</div>
          <p class="sk-testimonial-text">Llevaba años comprando ropa que nunca usaba. En el módulo 4 entendí por qué y reorganicé todo mi clóset en un fin de semana.</p>
          <p class="sk-testimonial-author">— Valentina, Guayaquil</p>
        </div>
        <div class="sk-testimonial-card">
          <div class="sk-testimonial-stars">★★★★★</div>
          <p class="sk-testimonial-text">El mejor dinero que he invertido en mí misma. Simple, práctico y transformador. Saruka explica todo con una claridad increíble.</p>
          <p class="sk-testimonial-author">— Daniela, Cuenca</p>
        </div>
      </div>
    </div>
  </section>

  {* ══ PRECIO ══ *}
  <section class="sk-section sk-section-soft">
    <div class="sk-container">
      <div class="sk-center" style="margin-bottom: 48px;">
        <span class="sk-eyebrow">Inversión</span>
        <h2 class="sk-h2">¿Cuánto has gastado en ropa<br>que nunca te pusiste?</h2>
        <div class="sk-divider"></div>
        <p style="font-size: 17px; color: var(--gray); max-width: 540px; margin: 0 auto; line-height: 1.8;">
          Probablemente mucho más que el valor de este curso. Hoy no estás comprando información. Estás aprendiendo a tomar mejores decisiones durante años.
        </p>
      </div>
      <div class="sk-price-box">
        <p style="font-size: 12px; letter-spacing: 2px; text-transform: uppercase; color: var(--gray); margin-bottom: 16px;">Acceso completo al curso</p>
        <p class="sk-price-tag"><sup>$</sup>{$price}<span style="font-size: 22px;"> USD</span></p>
        <p class="sk-price-label">Pago único · Acceso inmediato</p>
        <div style="margin: 32px 0;">
          <a href="{$buy_url}" class="sk-btn sk-btn-lg" style="width: 100%; display: block; text-align: center;">
            Quiero empezar mi transformación
          </a>
        </div>
        <div class="sk-guarantee">
          <strong>🛡️ Nuestra promesa</strong><br>
          Si haces todos los ejercicios y aplicas el método, vas a desarrollar un criterio completamente diferente para vestirte. No buscamos que copies tendencias. Buscamos que entiendas qué funciona para ti.
        </div>
      </div>
    </div>
  </section>

  {* ══ CIERRE ══ *}
  <section class="sk-closing">
    <div class="sk-closing-bg"></div>
    <div class="sk-closing-overlay"></div>
    <div class="sk-closing-content sk-container">
      <div class="sk-closing-lines" style="margin-bottom: 48px;">
        <p>Nunca fue falta de estilo.</p>
        <p>Nunca fue tu cuerpo.</p>
        <p>Nunca fue tu edad.</p>
        <p>Nunca fue tu presupuesto.</p>
        <p style="margin-top: 16px; color: rgba(255,255,255,0.9);">Solo necesitabas entender cómo funciona el color en ti.</p>
        <p style="color: var(--gold); font-style: italic;">Y eso es exactamente lo que vas a aprender aquí.</p>
      </div>
      <a href="{$buy_url}" class="sk-btn sk-btn-lg">
        Quiero empezar mi transformación
      </a>
      <p style="margin-top: 20px; font-size: 13px; color: rgba(255,255,255,0.35);">${$price} USD · Pago único · Acceso inmediato</p>
    </div>
  </section>

</div>
{/block}
