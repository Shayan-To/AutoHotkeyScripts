<div dir="rtl">
<p>به نام او</p>
<h1>توضیحات</h1>
<p>یه برنامه‌ای وجود داره به اسم <a href="https://autohotkey.com/">AutoHotkey</a>، باهاش می‌شه کلیدای کیبورد رو بهشون چیزای مختلف اختصاص داد. خیلی هم امکانات داره و تقریباً هر کاری می‌شه باهاش کرد.</p>
<p>این اسکریپت با AutoHotkey نوشته شده و می‌تونه یه سری شورتکات خوب به کیبوردتون اضافه کنه.</p>
<h2>مشکل ۱: نبودن علامتای معروف توی کیبورد استاندارد فارسی</h2>
<ul>
<li>توی کیبورد استاندارد فارسی یه سری علامتای خیلی معروف مثل @ و # وجود ندارن. این خیلی توی نوشتن اذیت می‌کنه. مثلاً وقتی می‌خوای کسی رو منشن کنی، یا مثلاً وقتی می‌خوای با MarkDown هدر بنویسی.</li>
<li>این اسکریپت به جز برای ۵ و ۷ که «،» و «٪» هستن، بقیه‌ی علامتا رو به همون علامتای کیبورد انگلیسی  تغییر می‌ده.</li>
</ul>
<h2>مشکل ۲: سخت بودن تغییر زبان</h2>
<ul>
<li>سخت بودن تغییر زبان مشکلیه که موقع نوشتن متن‌های دوزبانه خیلی اذیت می‌کنه.</li>
<li>این اسکریپت دکمه‌ی بی‌کاربرد <code dir="ltr">CapsLock</code> رو به این کار اختصاص می‌ده. با زدن <code dir="ltr">CapsLock</code>، بین زبان‌ها می‌تونید بچرخید. (البته <code dir="ltr">CapsLock</code> رو هم می‌تونید روشن و خاموش کنید!)</li>
<li>یه چیز دیگه هم این که MarkDown این امکان رو داره که کد‌هامون رو بین <code dir="ltr">`</code> بنویسیم. و ما وقتی داریم به فارسی تایپ می‌کنیم و می‌خوایم کد بنویسیم، باید یه بار <code dir="ltr">`</code> رو بزنیم، یه بار هم زبان رو عوض کنیم تا کدمون رو بنویسیم. این اسکریپت می‌تونه دکمه‌ی <code dir="ltr">`</code> رو اختصاص بده تا زبان رو هم عوض کنه.</li>
</ul>
<h2>مشکل ۳: نبودن دکمه‌ی Play/Pause توی بعضی از کیبوردا</h2>
<ul>
<li>این اسکریپت <code dir="ltr">Win+Z</code> برای رو برای این کار تغییر می‌ده.</li>
</ul>
<h2>مشکل ۴: خراب بودن شورت‌کات‌های کیبوردی Git Gui</h2>
<ul>
<li>این اسکریپت شورت‌کات‌های مورد استفاده‌ی Git Gui مثل <code dir="ltr">Ctrl+Shift+T</code> و <code dir="ltr">Ctrl+Shift+U</code> و <code dir="ltr">Ctrl+Shift+I</code> (که فقط وقتی کار می‌کنن که روی باکس پیام کامیت باشی) رو هم درست می‌کنه.</li>
</ul>
<h2>مشکل ۵: تقریباً غیر ممکن بودن وارد کردن کاراکتر‌های قالب‌بندی جهت (Directional Formatting Character)</h2>
<ul>
<li>وقتی توی Word یا یه ویرایشگر پیشرفته‌ی دیگه متن می‌نویسیم، خودش از روی زبان کیبورد جهت متن وارد شده رو تشخیص می‌ده و قالب‌بندی متن رو درست می‌کنه.</li>
<li>ولی وقتی قابلیت‌های قالب‌بندی پیشرفته (مثل Word یا HTML) وجود نداره (مثلاً وقتی جایی کامنت می‌ذاریم، یا توی تلگرام، یا هر جایی که از markdown استفاده می‌شه)، یه سری کاراکتر یونیکد وجود دارن که با استفاده از اونا می‌شه این قالب‌بندی رو انجام داد.</li>
<li>استفاده از ویرایشگر‌های پیشرفته...
<ul>
<li>کلاً هم استفاده کردن از نرم‌افزار‌هایی مثل Word بدی‌های زیادی داره:
<ul>
<li>حجم فایل خیلی زیاد می‌شه.</li>
<li>به راحتی قابل تبدیل نیست به فرمت‌های دیگه.</li>
<li>نمی‌تونیم راحت متوجه بشیم که ویرایشگر کجای متن داره چه قالب‌بندی‌ای رو پیاده می‌کنه.</li>
<li>اگه یه تعداد فایل داشته باشیم، نمی‌شه راحت توشون جستجو کرد.</li>
<li>نرم‌افزار‌های ویرایشگر سنگین و کندن (مخصوصاً وقتی حجم فایل زیاد می‌شه).</li>
<li>گیت نمی‌تونه خوب روی فایلا کار کنه.</li>
</ul>
</li>
<li>می‌شه گفت که تنها وقتی که Word چیز خوبیه، برای پرینت کردن یا تولید فایل PDFه.</li>
<li>اگه استفاده کردن از این کاراکتر‌ها رو یاد بگیریم و از یه چیزی شبیه markdown استفاده کنیم، زندگی خیلی ساده‌تر می‌شه.</li>
</ul>
</li>
<li>این کاراکترا نامرئی‌ن، و فقط طرز نمایش رو تغییر می‌دن.</li>
<li>نکته: این کاراکترا فقط داخل <strong>یه</strong> پاراگراف کار می‌کنن و از یه پاراگراف به پاراگراف بعدی ریست می‌شن.</li>
<li>چهار دسته کاراکتر قالب‌بندی جهت وجود داره:
<ul>
<li>‏Mark‌ها: دو تا کاراکتر وجود داره، «Left-to-right mark» و «Right-to-left mark»، صرفاً نقش یه کاراکتر چپ‌به‌راست یا راست‌به‌چپ رو بازی می‌کنن.
<ul>
<li>خیلی از نرم‌افزار‌های چند‌زبانه، از روی اولین کاراکتر غیر خنثی متن، جهت متن رو تشخیص می‌دن. مثلاً اگه متن با یه کاراکتر فارسی شروع بشه، راست‌چینش می‌کنن و اگه با یه کاراکتر انگلیسی شروع بشه، چپ‌چینش می‌کنن (پیامک هم همین جوریه معمولاً). برای متن‌هایی که مثلاً فارسی‌ن ولی با یه کلمه‌ی انگلیسی شروع می‌شن، می‌شه یه LRM یا RLM اول متن بذاریم تا جهتش درست بشه.</li>
<li>همچنین اگه بخوایم وسط یه متن فارسی یه همچین چیزی بنویسیم: «Apple،‏ Orange و Banana» (امتحان کنید و بنویسید، اولین کلمه و دومین جاشون کلمه عوض می‌شه و ویرگول هم جای بدی قرار می‌گیره)، می‌تونیم جلوی ویرگول یه RLM بذاریم تا بفهمه که این‌ها سه تا تیکه‌ی چپ‌به‌راستن وسط یه متن راست‌به‌چپ (نه دو تا تیکه).</li>
</ul>
</li>
<li>‏Embeddingها: باهاشون می‌شه یه تیکه از متن رو چپ‌به‌راست یا راست‌به‌چپ کرد.
<ul>
<li>‏LRE و RLE یه embedding چپ‌چین یا راست‌چین رو شروع می‌کنن. و یه کاراکتر «Pop Directional Formatting» هم وجود داره که embedding رو تموم می‌کنه.</li>
<li>یه کاری که با embedding‌ها می‌شه کرد اینه که اول هر پاراگراف بذاریمشون تا جهت پاراگرافمون درست بشه (توی برنامه‌هایی که راست‌چین پشتیبانی نمی‌کنن).</li>
</ul>
</li>
<li>‏Isolate‌ها: همون کار embedding‌ها رو انجام می‌دن، فقط یه سری مشکلاتشون رو درست کردن. اما نمی‌شه ازشون استفاده کرد فعلاً، چون تقریباً هیچ نمایش‌دهنده‌ای ازشون پشتیبانی نمی‌کنه (من تا حالا ندیدم). (یا رفتار عجیب و غریب از خودش نشون می‌ده، یا کلاً هیچ کاری نمی‌کنه.)
<ul>
<li>مثل بالایی LRI و RLI داریم، و یه کاراکتر «Pop Directional Isolate» (که با PDF فرق داره).</li>
<li>یه کاراکتر دیگه هم داره، «First Strong Isolate» که یه isolate رو بدون جهت شروع می‌کنه و برای تعیین جهت، به اولین کاراکتر غیر خنثی نگاه می‌کنه. (اگه نرم‌افزارا از isolate‌ها پشتیبانی می‌کردن، می‌شد اول همه‌ی پاراگرافامون یه FSI بزنیم تا همه‌جا، حتی جا‌هایی که تشخیص راست‌به‌چپ وجود نداره، متنمون درست نمایش داده بشه.)</li>
</ul>
</li>
<li>‏Override‌ها: خیلی شبیه embedding‌ها هستن، ولی یه فرق بزرگ دارن، کل کاراکتر‌ها رو چپه می‌کنن.
<ul>
<li>مثلاً اگه وسط یه LRO و یه PDF بنویسید «سلام»، بهتون نشون می‌ده «‭سلام‬» (&lt;- این‌جا واقعاً از LRO و PDF استفاده شده).</li>
<li>کاراکتر «Pop directional formatting» بین embedding و override مشترکه (ولی برای isolate یه کاراکتر دیگه‌س).</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1>راهنما</h1>
<h2>عوض کردن زبان</h2>
<ul>
<li>اگه دکمه‌ی <code dir="ltr">CapsLock</code> رو بزنید بین زبان‌هایی که تعریف شده می‌چرخه.</li>
<li>اگه <code dir="ltr">Shift+CapsLock</code> رو بزنید، بین کیبورد‌های زبانی که روش هستید می‌چرخه.</li>
<li>اگه <code dir="ltr">Ctrl</code> سمت راست رو با <code dir="ltr">CapsLock</code> بزنید، کیبورد راست‌دست زبانی که روش هستید رو فعال می‌کنه.</li>
<li>و اگه <code dir="ltr">Ctrl</code> سمت چپ رو با <code dir="ltr">CapsLock</code> بزنید، کیبورد چپ‌دست زبانی که روش هستید رو فعال می‌کنه.</li>
<li>در ضمن، آخرین کیبوردی که توی هر زبان روش بودید رو یادش می‌مونه و وقتی برمی‌گردید همون رو فعال می‌کنه.</li>
<li>نکته: کیبورد‌هایی که انتخاب می‌کنید باید به سیستمتون اضافه شده باشن، وگرنه نمی‌تونه فعالش کنه.</li>
</ul>
<h2>وارد کردن کاراکتر‌های قالب‌بندی جهت</h2>
<ul>
<li>برای Mark‌ها، <code dir="ltr">CapsLock</code> رو با فلش سمت راست (RLM) یا چپ (LRM) بزنید.</li>
<li>برای Embedding‌ها، <code dir="ltr">Shift+CapsLock</code> رو با فلش سمت راست (RLE) یا چپ (LRE) یا بالا (PDF) بزنید.</li>
<li>برای Isolate‌ها، <code dir="ltr">Ctrl+CapsLock</code> رو با فلش سمت راست (RLI) یا چپ (LRI) یا پایین (FSI) یا بالا (PDI) بزنید.</li>
<li>برای Override‌ها، <code dir="ltr">Alt+CapsLock</code> رو با فلش سمت راست (RLO) یا چپ (LRO) یا بالا (PDF) بزنید.</li>
<li>برای این که قاطی نکنه، اول <code dir="ltr">CapsLock</code> رو نگه دارید، بعد <code dir="ltr">Shift</code> یا <code dir="ltr">Ctrl</code> یا <code dir="ltr">Alt</code> رو فشار بدید.</li>
<li>می‌تونید جای دکمه‌ی چپ و راست رو توی همه‌ی اینا عوض کنید (به بخش <a href="#initial-config">تنظیمات اولیه‌ی اسکریپت</a> مراجعه کنید).</li>
</ul>
<h2>فعال و غیرفعال کردن امکانات</h2>
<ul>
<li>برای غیر فعال کردن یا دوباره فعال کردن اصلاح علامت‌های معروف کیبورد فارسی، <code dir="ltr">CapsLock+\</code> رو بزنید.</li>
<li>برای غیر فعال کردن یا دوباره فعال کردن تغییر زبان با دکمه‌ی <code dir="ltr">`</code> از <code dir="ltr">CapsLock+`‎</code> استفاده کنید.</li>
<li>برای از کار انداختن یا دوباره به کار انداختن دکمه‌ی <code dir="ltr">Insert</code> هم از <code dir="ltr">CapsLock+Insert</code> استفاده کنید. (فقط خود <code dir="ltr">Insert</code> از کار می‌افته و ترکیب‌هاش مثل <code dir="ltr">Ctrl+Insert</code> سر جاشون هستن.)</li>
<li>از <code dir="ltr">CapsLock+Tab</code> هم می‌تونید برای روشن و خاموش کردن خود <code dir="ltr">CapsLock</code> استفاده کنید.</li>
</ul>
<h2>سایر امکانات</h2>
<ul>
<li>برای Play یا Pause کردن پلیرتون می‌تونید از <code dir="ltr">Win+Z</code> استفاده کنید. (توی بعضی پلیر‌ها باید این رو توی تنظیماتش فعال کنید.)</li>
<li>توی Git Gui:
<ul>
<li>از <code dir="ltr">Ctrl+Shift+T</code> برای اضافه کردن فایل جاری به ایندکس استفاده کنید.</li>
<li>از <code dir="ltr">Ctrl+Shift+U</code> برای حذف فایل جاری از ایندکس استفاده کنید.</li>
<li>از <code dir="ltr">Ctrl+Shift+I</code> برای اضافه کردن همه‌ی تغییرات به ایندکس استفاده کنید.</li>
</ul>
</li>
</ul>
<h2><a name="user-content-initial-config"></a>تنظیمات اولیه‌ی اسکریپت</h2>
<ul>
<li>اگه فایل Config.ahk رو با یه ویرایشگر متنی باز کنید، تنظیمات اسکریپت اون‌جاس. می‌تونید این چیزا رو مشخص کنید:
<ul>
<li>فعال یا غیرفعال بودن شورت‌کات‌های اصلاح شده‌ی Git Gui.</li>
<li>فعال یا غیرفعال بودن دکمه‌ی Play/Pause.</li>
<li>برعکس کردن دکمه‌ی چپ و راست برای کاراکتر‌های قالب‌بندی جهت.</li>
<li>وضعیت اولیه‌ی فعال یا غیر فعال بودن هر کدوم از امکانات.</li>
<li>زبان‌هاتون و کیبورد‌های هر کدوم از زبان‌ها.</li>
</ul>
</li>
<li>درباره‌ی تغییر دادن زبان‌ها:</li>
<li>متغیر <code dir="ltr">KeyboardsData</code> داخلش اطلاعات زبان‌ها و کیبورد‌هاتون رو نگه می‌داره. (به خط اول و آخرش دست نزنید.)</li>
<li>برای هر زبانی سه دسته کیبورد می‌تونید تعریف کنید:
<ul>
<li>یه دسته کیبورد‌های <code dir="ltr">Normal</code> که کیبورد‌های پیش‌فرضن و با <code dir="ltr">Shift+CapsLock</code> می‌تونید بینشون بچرخید.</li>
<li>دو تا دسته‌ی دیگه هم <code dir="ltr">Left</code> و <code dir="ltr">Right</code> ن که با <code dir="ltr">Ctrl+CapsLock</code> می‌تونید بینشون بچرخید.</li>
</ul>
</li>
<li>اگه می‌خواید کیبورد دیگه‌ای اضافه کنید، باید عددش رو بدونید. می‌تونید وقتی اون کیبورد فعاله، <code dir="ltr">Alt+CapsLock</code> رو بزنید تا عدد مربوط به کیبوردتون رو نشونتون بده. (فقط نمی‌دونم چرا باید دو بار بزنید! دفعه‌ی اول عدد کیبورد قبلی رو نشون می‌ده، دفعه‌ی دوم عدد کیبورد فعلی رو...!)</li>
</ul>
<h2>غیر فعال کردن شورت‌کات‌های قدیمی تغییر زبان برای ویندوز ۸ به بعد</h2>
<ul>
<li>چون توی ویندوز ۸ به بعد <code dir="ltr">Win+Space</code> برای تغییر زبان گذاشته شده (و اگه گیر کنیم می‌تونیم از <code dir="ltr">Win+Space</code> استفاده کنیم)، می‌شه شورت‌کات‌های قدیمی ویندوز رو غیرفعال کرد.</li>
<li>وارد «Control Panel» بشید. (توی ویندوز ۱۰ می‌تونید یه Windows Explorer باز کنید و توی فلِش پشت آدرس‌بار پیداش کنید.)<br>
<a href="Images/ControlPanel.png" target="_blank"><img src="Images/ControlPanel.png" alt="Control Panel" style="max-width:100%;"></a></li>
<li>وارد «Clock, Region and Language» بشید.</li>
<li>وارد «Language» بشید. (این‌جا می‌تونید زبان اضافه یا کم کنید.)</li>
<li>وارد «Advanced settings» بشید (نوار سمت چپ).</li>
<li>توی بخش «Switching input methods»،‏ «Change language bar hot keys» رو بزنید.</li>
<li>لیست رو نشونتون می‌ده که می‌تونید تغییرش بدید.</li>
</ul>
<h2>اجرا شدن موقع شروع ویندوز</h2>
<ul>
<li>یه شورتکات از فایل <code dir="ltr">Main.ahk</code> به توی پوشه‌ی <code dir="ltr">Startup</code> داخل استارت ویندوز اضافه کنید.</li>
<li>برای پیدا کردن پوشه‌ی <code dir="ltr">Startup</code> می‌تونید این آدرس رو توی آدرس‌بارتون پیست کنید: <code dir="ltr">%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup</code></li>
</ul>
</div>
