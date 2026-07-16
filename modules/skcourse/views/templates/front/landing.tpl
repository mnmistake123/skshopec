{block name='breadcrumb'}{/block}

{block name='content'}
<style>
  /* Scoped styles: safe to paste into the skcourse landing template. */
  .sr-course, .sr-course * { box-sizing: border-box; }
  .sr-course {
    --ink: #231f20;
    --wine: #782f40;
    --rose: #c87b86;
    --blush: #f8eeee;
    --cream: #fcf8f3;
    --sand: #e8d6c8;
    --paper: #fffdfb;
    --muted: #6f6260;
    color: var(--ink); background: var(--paper);
    font-family: "Helvetica Neue", Arial, sans-serif; line-height: 1.55;
  }
  .sr-course img { display: block; max-width: 100%; }
  .sr-course a { text-decoration: none; }
  .sr-wrap { width: min(1120px, calc(100% - 48px)); margin: 0 auto; }
  .sr-script { font-family: Georgia, "Times New Roman", serif; font-style: italic; font-weight: 400; }
  .sr-kicker { display: block; color: var(--wine); font-size: 10px; font-weight: 700; letter-spacing: .19em; text-transform: uppercase; }
  .sr-title { margin: 14px 0 0; font-family: Georgia, "Times New Roman", serif; font-size: clamp(36px, 5vw, 68px); font-weight: 400; letter-spacing: -.045em; line-height: .98; }
  .sr-copy { color: var(--muted); font-size: 16px; line-height: 1.8; }
  .sr-button { display: inline-flex; align-items: center; justify-content: center; min-height: 54px; padding: 14px 28px; background: var(--wine); color: #fff; border: 1px solid var(--wine); border-radius: 999px; font-size: 11px; font-weight: 700; letter-spacing: .13em; text-align: center; text-transform: uppercase; transition: .25s ease; }
  .sr-button:hover { background: transparent; color: var(--wine); transform: translateY(-2px); }
  .sr-button--light { background: #fff; border-color: #fff; color: var(--wine); }
  .sr-button--light:hover { background: transparent; color: #fff; }

  .sr-hero { min-height: min(780px, calc(100vh - 40px)); display: grid; grid-template-columns: .96fr 1.04fr; background: var(--blush); overflow: hidden; }
  .sr-hero__content { display: flex; flex-direction: column; justify-content: center; padding: 72px clamp(28px, 7vw, 112px); position: relative; z-index: 1; }
  .sr-hero__content:before { content: ""; position: absolute; width: 360px; height: 360px; top: -170px; left: -120px; border: 1px solid rgba(120,47,64,.18); border-radius: 50%; }
  .sr-hero__content > * { position: relative; }
  .sr-hero .sr-title { max-width: 610px; }
  .sr-hero .sr-title { font-size: clamp(32px, 3.45vw, 48px); letter-spacing: -.04em; }
  .sr-hero__lead { max-width: 500px; margin: 25px 0 31px; color: #554545; font-size: 17px; line-height: 1.75; }
  .sr-hero__note { margin-top: 24px; color: var(--wine); font-size: 12px; font-style: italic; }
  .sr-hero__photo { min-height: 550px; position: relative; background: #d8a9ac; }
  .sr-hero__photo img { width: 100%; height: 100%; min-height: 550px; object-fit: cover; object-position: center top; }
  .sr-hero__photo:after { content: ""; position: absolute; inset: 0; background: linear-gradient(90deg, rgba(120,47,64,.14), transparent 35%); pointer-events: none; }
  .sr-hero__badge { position: absolute; right: 35px; bottom: 35px; width: 132px; height: 132px; display: grid; place-items: center; padding: 17px; border-radius: 50%; background: var(--wine); color: #fff; font-size: 10px; font-weight: 700; letter-spacing: .12em; line-height: 1.35; text-align: center; text-transform: uppercase; transform: rotate(10deg); }

  .sr-intro { padding: 116px 0; }
  .sr-intro__grid { display: grid; grid-template-columns: 1fr 1.05fr; gap: clamp(40px, 8vw, 120px); align-items: center; }
  .sr-intro__image { position: relative; padding: 0 28px 34px 0; }
  .sr-intro__image:after { content: ""; position: absolute; right: 0; bottom: 0; width: 74%; height: 76%; border: 1px solid var(--rose); z-index: 0; }
  .sr-intro__image img { width: 100%; height: 570px; object-fit: cover; position: relative; z-index: 1; }
  .sr-intro__text .sr-title { font-size: clamp(34px, 4.3vw, 56px); }
  .sr-intro__text .sr-copy { max-width: 470px; margin: 24px 0; }
  .sr-mini-list { padding: 0; margin: 30px 0; list-style: none; }
  .sr-mini-list li { padding: 12px 0; border-bottom: 1px solid var(--sand); color: #4f4141; font-size: 14px; }
  .sr-mini-list li:before { content: "✦"; margin-right: 12px; color: var(--wine); }
  .sr-assessment { padding: 112px 0; background: var(--paper); }
  .sr-assessment__grid { display: grid; grid-template-columns: 1fr 1fr; gap: clamp(35px, 7vw, 100px); }
  .sr-assessment__column { padding: 6px 0; }
  .sr-assessment__column + .sr-assessment__column { border-left: 1px solid var(--sand); padding-left: clamp(35px, 7vw, 100px); }
  .sr-assessment h3 { margin: 14px 0 22px; font-family: Georgia, serif; font-size: clamp(30px, 3.5vw, 47px); font-weight: 400; letter-spacing: -.04em; line-height: 1.05; }
  .sr-assessment__list { padding: 0; margin: 0; list-style: none; }
  .sr-assessment__list li { padding: 13px 0; border-bottom: 1px solid var(--sand); color: var(--muted); font-size: 14px; line-height: 1.55; }
  .sr-assessment__list li:before { content: "✦"; margin-right: 10px; color: var(--wine); }
  .sr-assessment__end { margin: 24px 0 0; color: var(--wine); font-family: Georgia, serif; font-size: 21px; font-style: italic; }
  .sr-change { padding: 112px 0; background: var(--cream); }
  .sr-change__grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
  .sr-change__card { padding: clamp(28px, 4vw, 48px); background: #fff; border-top: 3px solid var(--sand); }
  .sr-change__card--after { background: var(--wine); border-color: var(--wine); color: #fff; }
  .sr-change__card h3 { margin: 0 0 24px; color: var(--wine); font-family: Georgia, serif; font-size: 31px; font-weight: 400; font-style: italic; }
  .sr-change__card--after h3 { color: #f7cdd0; }
  .sr-change__card ul { padding: 0; margin: 0; list-style: none; }
  .sr-change__card li { padding: 12px 0; border-bottom: 1px solid var(--sand); color: var(--muted); font-size: 14px; }
  .sr-change__card--after li { border-color: rgba(255,255,255,.2); color: rgba(255,255,255,.84); }
  .sr-testimonials { padding: 112px 0; background: var(--paper); }
  .sr-testimonials__grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; }
  .sr-testimonial { min-height: 270px; padding: 32px 28px; border: 1px solid var(--sand); background: var(--cream); }
  .sr-testimonial__stars { color: var(--rose); letter-spacing: .16em; font-size: 13px; }
  .sr-testimonial p { margin: 28px 0; color: var(--muted); font-family: Georgia, serif; font-size: 18px; font-style: italic; line-height: 1.55; }
  .sr-testimonial b { color: var(--wine); font-size: 11px; letter-spacing: .08em; text-transform: uppercase; }

  .sr-manifesto { position: relative; padding: 120px 0; overflow: hidden; background: var(--wine); color: #fff; text-align: center; }
  .sr-manifesto:before, .sr-manifesto:after { content: ""; position: absolute; width: 420px; height: 420px; border: 1px solid rgba(255,255,255,.16); border-radius: 50%; }
  .sr-manifesto:before { top: -220px; left: -120px; } .sr-manifesto:after { right: -180px; bottom: -250px; }
  .sr-manifesto .sr-wrap { position: relative; }
  .sr-manifesto .sr-kicker { color: #f8cfd1; }
  .sr-manifesto blockquote { max-width: 830px; margin: 18px auto 0; font-family: Georgia, serif; font-size: clamp(34px, 5vw, 65px); font-weight: 400; letter-spacing: -.045em; line-height: 1.08; }
  .sr-manifesto p { max-width: 580px; margin: 28px auto 0; color: rgba(255,255,255,.78); }

  .sr-gallery { display: grid; grid-template-columns: 1.13fr .87fr; min-height: 570px; }
  .sr-gallery__main, .sr-gallery__side { position: relative; overflow: hidden; }
  .sr-gallery img { width: 100%; height: 100%; object-fit: cover; }
  .sr-gallery__main { min-height: 570px; } .sr-gallery__side { min-height: 570px; }
  .sr-gallery__main:after { content: "Tu clóset ya tiene\A lo que necesitas."; white-space: pre-line; position: absolute; left: clamp(24px, 6vw, 80px); bottom: 48px; max-width: 390px; color: #fff; font-family: Georgia, serif; font-size: clamp(30px, 4vw, 52px); font-style: italic; line-height: 1.02; text-shadow: 0 2px 18px rgba(0,0,0,.24); }

  .sr-journey { padding: 120px 0; background: var(--cream); }
  .sr-heading { max-width: 650px; margin-bottom: 56px; }
  .sr-heading .sr-title { font-size: clamp(36px, 4.8vw, 58px); }
  .sr-heading .sr-copy { margin-top: 18px; }
  .sr-modules { display: grid; grid-template-columns: repeat(5, 1fr); border-top: 1px solid var(--sand); border-left: 1px solid var(--sand); }
  .sr-module { min-height: 300px; padding: 25px 20px; border-right: 1px solid var(--sand); border-bottom: 1px solid var(--sand); background: rgba(255,255,255,.42); transition: .25s ease; }
  .sr-module:hover { background: #fff; transform: translateY(-7px); box-shadow: 0 16px 26px rgba(79,45,45,.08); }
  .sr-module__no { color: var(--rose); font-family: Georgia, serif; font-size: 36px; font-style: italic; }
  .sr-module h3 { margin: 55px 0 12px; font-family: Georgia, serif; font-size: 21px; font-weight: 400; line-height: 1.15; }
  .sr-module p { color: var(--muted); font-size: 13px; line-height: 1.65; }
  .sr-journey__cta { margin-top: 48px; text-align: center; }

  .sr-benefits { padding: 112px 0; }
  .sr-benefits__grid { display: grid; grid-template-columns: .92fr 1.08fr; gap: clamp(44px, 8vw, 118px); align-items: center; }
  .sr-benefits__photos { display: grid; gap: 16px; align-items: end; }
  .sr-benefits__photos img:first-child { height: 390px; object-fit: cover; } .sr-benefits__photos img:last-child { height: 480px; object-fit: cover; }
  .sr-benefit-list { margin: 30px 0 0; border-top: 1px solid var(--sand); }
  .sr-benefit { display: grid; grid-template-columns: 36px 1fr; gap: 14px; padding: 18px 0; border-bottom: 1px solid var(--sand); }
  .sr-benefit b { color: var(--wine); font-family: Georgia, serif; font-size: 24px; font-weight: 400; font-style: italic; }
  .sr-benefit strong { display: block; margin-bottom: 4px; font-size: 14px; } .sr-benefit span { color: var(--muted); font-size: 13px; }

  .sr-about { display: grid; grid-template-columns: 1fr 1fr; background: var(--blush); }
  .sr-about__photo { min-height: 630px; } .sr-about__photo img { height: 100%; width: 100%; object-fit: cover; }
  .sr-about__content { display: flex; flex-direction: column; justify-content: center; padding: clamp(60px, 9vw, 130px); }
  .sr-about__content .sr-title { font-size: clamp(38px, 4.8vw, 60px); }
  .sr-about__stats { display: flex; gap: 26px; margin-top: 32px; }
  .sr-about__stat b { display: block; color: var(--wine); font-family: Georgia, serif; font-size: 33px; font-weight: 400; } .sr-about__stat span { color: var(--muted); font-size: 10px; font-weight: 700; letter-spacing: .12em; text-transform: uppercase; }

  .sr-invest { padding: 120px 0; text-align: center; background: var(--cream); }
  .sr-invest .sr-heading { margin: 0 auto 38px; }
  .sr-price-card { width: min(460px, 100%); margin: 0 auto; padding: 48px 38px; background: #fff; border: 1px solid var(--sand); box-shadow: 14px 14px 0 var(--sand); }
  .sr-price-card__label { color: var(--wine); font-size: 10px; font-weight: 700; letter-spacing: .16em; text-transform: uppercase; }
  .sr-price { margin: 14px 0 6px; font-family: Georgia, serif; font-size: 78px; font-weight: 400; letter-spacing: -.07em; line-height: 1; } .sr-price sup { font-size: 27px; vertical-align: top; }
  .sr-price-card p { color: var(--muted); font-size: 13px; } .sr-price-card .sr-button { width: 100%; margin-top: 26px; }
  .sr-price-card__fine { margin-top: 20px; font-size: 11px !important; }

  .sr-closing { position: relative; min-height: 570px; display: grid; place-items: center; overflow: hidden; color: #fff; text-align: center; background: #331820; }
  .sr-closing__image { position: absolute; inset: 0; opacity: .5; } .sr-closing__image img { width: 100%; height: 100%; object-fit: cover; } .sr-closing:after { content: ""; position: absolute; inset: 0; background: rgba(51,24,32,.48); }
  .sr-closing__content { position: relative; z-index: 1; width: min(700px, calc(100% - 40px)); padding: 80px 0; }
  .sr-closing .sr-kicker { color: #f3c8cb; } .sr-closing h2 { margin: 15px 0 24px; font-family: Georgia, serif; font-size: clamp(29px, 3.45vw, 47px); font-weight: 400; letter-spacing: -.045em; line-height: 1.08; } .sr-closing p { margin-bottom: 30px; color: rgba(255,255,255,.86); }

  @media (max-width: 900px) { .sr-modules { grid-template-columns: repeat(3, 1fr); } .sr-module h3 { margin-top: 35px; } }
  @media (max-width: 700px) {
    .sr-wrap { width: min(100% - 36px, 560px); } .sr-hero, .sr-intro__grid, .sr-gallery, .sr-benefits__grid, .sr-about, .sr-assessment__grid, .sr-change__grid, .sr-testimonials__grid { grid-template-columns: 1fr; }
    .sr-hero__content { min-height: 570px; padding: 75px 30px 58px; } .sr-hero__photo, .sr-hero__photo img { min-height: 440px; } .sr-hero__badge { right: 20px; bottom: 20px; width: 110px; height: 110px; font-size: 8px; }
    .sr-intro, .sr-journey, .sr-benefits, .sr-invest { padding: 78px 0; } .sr-intro__image img { height: 440px; } .sr-gallery__main, .sr-gallery__side { min-height: 360px; }
    .sr-modules { grid-template-columns: 1fr; } .sr-module { min-height: auto; padding: 25px; } .sr-module h3 { margin: 18px 0 10px; }
    .sr-benefits__photos img:first-child { height: 310px; } .sr-benefits__photos img:last-child { height: 370px; } .sr-about__photo { min-height: 460px; } .sr-about__content { padding: 72px 28px; }
    .sr-assessment__column + .sr-assessment__column { border-top: 1px solid var(--sand); border-left: 0; padding: 42px 0 0; } .sr-assessment, .sr-change, .sr-testimonials { padding: 78px 0; }
  }
</style>

<main class="sr-course">
  <section class="sr-hero">
    <div class="sr-hero__content">
      <span class="sr-kicker">Curso de Colorimetría · Saruka Rodriguez</span>
      <h1 class="sr-title">Nunca fue falta de estilo.<br><span class="sr-script">Solo nadie te enseñó a encontrar tus colores.</span></h1>
      <p class="sr-hero__lead">Aprende a identificar tu paleta personal, entender tu identidad cromática y construir un clóset donde todo combine contigo. Más de 2 horas de contenido práctico con ejercicios que aplicarás desde el primer día.</p>
      <div><a class="sr-button" href="{$buy_url}">Quiero descubrir mi paleta</a></div>
      <p class="sr-hero__note">5 módulos · Más de 2 horas de clases · Acceso inmediato</p>
    </div>
    <div class="sr-hero__photo"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk1.png" alt="Saruka Rodriguez, curso de colorimetría"></div>
  </section>

  <section class="sr-intro"><div class="sr-wrap sr-intro__grid">
    <div class="sr-intro__image"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk2.png" alt="Estilo y color personal"></div>
    <div class="sr-intro__text"><span class="sr-kicker">Colorimetría personal</span><h2 class="sr-title">El color no es moda.<br>Es <span class="sr-script">identidad.</span></h2>
      <p class="sr-copy">Cuando entiendes tus colores, todo lo demás se vuelve más fácil.</p>
      <a class="sr-button" href="{$buy_url}">Quiero descubrir mi paleta</a>
    </div>
  </div></section>

  <section class="sr-assessment"><div class="sr-wrap sr-assessment__grid">
    <div class="sr-assessment__column"><span class="sr-kicker">¿Te identificas?</span><h3>Si alguna vez has sentido esto…</h3><ul class="sr-assessment__list"><li>Tengo mucha ropa y siento que nunca tengo qué ponerme.</li><li>Compro prendas que luego nunca vuelvo a usar.</li><li>Veo outfits increíbles en otras pero en mí no funcionan.</li><li>No sé qué colores realmente me favorecen.</li><li>Paso demasiado tiempo decidiendo qué ponerme.</li><li>Siento que mi imagen no refleja quién soy.</li></ul><p class="sr-assessment__end">Entonces este curso fue creado para ti.</p></div>
    <div class="sr-assessment__column"><span class="sr-kicker">Lo que vas a lograr</span><h3>Vas a salir sabiendo exactamente:</h3><ul class="sr-assessment__list"><li>Qué colores hacen que tu piel se vea más luminosa.</li><li>Cómo identificar tu subtono de piel.</li><li>Cómo descubrir tu estación cromática.</li><li>Cómo crear outfits sin complicarte.</li><li>Cómo comprar menos y aprovechar más tu clóset.</li><li>Cómo construir una imagen coherente contigo.</li></ul></div>
  </div></section>

  <section class="sr-change"><div class="sr-wrap"><div class="sr-heading"><span class="sr-kicker">El gran cambio</span><h2 class="sr-title">Una decisión que transforma<br>cómo te ves y cómo te sientes</h2></div><div class="sr-change__grid"><div class="sr-change__card"><h3>Antes del curso</h3><ul><li>❌ Comprabas por impulso sin criterio.</li><li>❌ Dudabas frente al espejo cada mañana.</li><li>❌ Copiabas outfits que no te representaban.</li><li>❌ Pensabas que necesitabas más ropa.</li><li>❌ Sentías que algo faltaba, sin saber qué.</li></ul></div><div class="sr-change__card sr-change__card--after"><h3>Después del curso</h3><ul><li>✅ Compras con criterio e intención.</li><li>✅ Sabes exactamente qué te favorece.</li><li>✅ Tu ropa trabaja para ti, no al revés.</li><li>✅ Tu clóset tiene menos pero rinde más.</li><li>✅ Tu imagen refleja quién realmente eres.</li></ul></div></div></div></section>

  <section class="sr-gallery"><div class="sr-gallery__main"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk3.png" alt="Looks que expresan identidad"></div><div class="sr-gallery__side"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk5.png" alt="Inspiración de estilo"></div></section>

  <section class="sr-journey"><div class="sr-wrap"><div class="sr-heading"><span class="sr-kicker">El método</span><h2 class="sr-title">Cinco pasos para una imagen que <span class="sr-script">sí se siente como tú.</span></h2><p class="sr-copy">Un recorrido claro, práctico y pensado para que apliques cada lección en tu espejo, tu clóset y tu próxima compra.</p></div>
    <div class="sr-modules">
      <article class="sr-module"><span class="sr-module__no">01</span><h3>El poder del color</h3><p>Entiende por qué algunos tonos te iluminan y otros no hacen justicia a tu belleza.</p></article>
      <article class="sr-module"><span class="sr-module__no">02</span><h3>Lee tu piel</h3><p>Identifica tu subtono, contraste y rasgos con ejercicios sencillos desde casa.</p></article>
      <article class="sr-module"><span class="sr-module__no">03</span><h3>Tu estación</h3><p>Encuentra la familia cromática que hace que tu rostro cobre vida.</p></article>
      <article class="sr-module"><span class="sr-module__no">04</span><h3>Tu clóset, a tu favor</h3><p>Convierte lo que ya tienes en combinaciones fáciles, intencionales y lindas.</p></article>
      <article class="sr-module"><span class="sr-module__no">05</span><h3>Proyecta tu esencia</h3><p>Haz del color una firma personal que te acompañe todos los días.</p></article>
    </div><div class="sr-journey__cta"><a class="sr-button" href="{$buy_url}">Quiero empezar</a></div>
  </div></section>

  <section class="sr-benefits"><div class="sr-wrap sr-benefits__grid"><div class="sr-benefits__photos"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk4.png" alt="Asesoría de imagen"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk6.png" alt="Moda y color"></div><div><span class="sr-kicker">Lo que recibes</span><h2 class="sr-title">Todo para mirar tu estilo <span class="sr-script">con otros ojos.</span></h2><div class="sr-benefit-list">
    <div class="sr-benefit"><b>✦</b><div><strong>Clases en video, a tu ritmo</strong><span>Más de dos horas de contenido claro y cercano.</span></div></div>
    <div class="sr-benefit"><b>✦</b><div><strong>Ejercicios prácticos guiados</strong><span>Lleva la teoría directamente a tu espejo y tu clóset.</span></div></div>
    <div class="sr-benefit"><b>✦</b><div><strong>Material de apoyo descargable</strong><span>Ten tu guía siempre a mano cuando vayas de compras.</span></div></div>
    <div class="sr-benefit"><b>✦</b><div><strong>Acceso desde cualquier dispositivo</strong><span>Vuelve a tus lecciones cuando quieras y donde quieras.</span></div></div>
  </div></div></div></section>

  <section class="sr-about"><div class="sr-about__photo"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk7.png" alt="Saruka Rodriguez"></div><div class="sr-about__content"><span class="sr-kicker">Tu instructora</span><h2 class="sr-title">Aprende de quien hace de la imagen un <span class="sr-script">lenguaje.</span></h2><p class="sr-copy">Saruka Rodriguez es asesora de moda ecuatoriana y fundadora de la marca que lleva su nombre. Su mirada combina moda, identidad y una convicción muy simple: verte bien debe hacerte sentir todavía más tú.</p><p class="sr-copy">En este curso comparte el método que convierte el color en tu herramienta de estilo más poderosa.</p><div class="sr-about__stats"><div class="sr-about__stat"><b>10+</b><span>Países</span></div><div class="sr-about__stat"><b>2K+</b><span>Alumnas</span></div><div class="sr-about__stat"><b>15+</b><span>Años creando</span></div></div></div></section>

  <section class="sr-testimonials"><div class="sr-wrap"><div class="sr-heading"><span class="sr-kicker">Lo que dicen ellas</span><h2 class="sr-title">Miles de mujeres ya encontraron sus colores.</h2></div><div class="sr-testimonials__grid"><article class="sr-testimonial"><span class="sr-testimonial__stars">★★★★★</span><p>“Nunca entendí por qué ciertos colores me apagaban hasta que tomé este curso. Ahora compro con criterio y me siento más yo que nunca.”</p><b>— María José, Quito</b></article><article class="sr-testimonial"><span class="sr-testimonial__stars">★★★★★</span><p>“Llevaba años comprando ropa que nunca usaba. En el módulo 4 entendí por qué y reorganicé todo mi clóset en un fin de semana.”</p><b>— Valentina, Guayaquil</b></article><article class="sr-testimonial"><span class="sr-testimonial__stars">★★★★★</span><p>“El mejor dinero que he invertido en mí misma. Simple, práctico y transformador. Saruka explica todo con una claridad increíble.”</p><b>— Daniela, Cuenca</b></article></div></div></section>

  <section class="sr-invest"><div class="sr-wrap"><div class="sr-heading"><span class="sr-kicker">Tu inversión</span><h2 class="sr-title">No es otro curso. Es una forma nueva de <span class="sr-script">elegirte.</span></h2><p class="sr-copy">Una decisión que te acompañará en cada compra, cada foto y cada vez que te mires al espejo.</p></div><div class="sr-price-card"><span class="sr-price-card__label">Acceso completo al curso</span><div class="sr-price"><sup>$</sup>{$price}</div><p>USD · pago único · acceso inmediato</p><a class="sr-button" href="{$buy_url}">Quiero mi acceso ahora</a><p class="sr-price-card__fine">Hazlo a tu ritmo. Vuelve a las lecciones siempre que lo necesites.</p></div></div></section>

  <section class="sr-closing"><div class="sr-closing__image"><img src="https://skshop.com.ec/modules/skcourse/views/img/sk1.png" alt="Curso de colorimetría Saruka"></div><div class="sr-closing__content"><span class="sr-kicker">Es tu momento</span><h2>Nunca fue falta de estilo.<br>Nunca fue tu cuerpo.<br>Nunca fue tu edad.<br>Nunca fue tu presupuesto.</h2><p>Solo necesitabas entender cómo funciona el color en ti.<br><span class="sr-script">Y eso es exactamente lo que vas a aprender aquí.</span></p><a class="sr-button sr-button--light" href="{$buy_url}">Quiero empezar mi transformación</a></div></section>
</main>
{/block}
