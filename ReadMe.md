به نام او

# توضیحات

یه برنامه‌ای وجود داره به اسم AutoHotkey، باهاش می‌شه کلیدای کیبورد رو بهشون چیزای مختلف اختصاص داد. خیلی هم امکانات داره و تقریباً هر کاری می‌شه باهاش کرد.

باهاش یه چیزی نوشتم، امکاناتش رو توضیح می‌دم:

## مشکل ۱: نبودن علامتای معروف توی کیبورد استاندارد فارسی

- توی کیبورد استاندارد فارسی یه سری علامتای خیلی معروف مثل @ و # وجود ندارن. این خیلی توی نوشتن اذیت می‌کنه. مثلاً وقتی می‌خوای کسی رو منشن کنی، یا مثلاً وقتی می‌خوای با MarkDown هدر بنویسی.
- این اسکریپت به جز برای ۵ و ۷ که «،» و «٪» هستن، بقیه‌ی علامتا رو به همون علامتای کیبورد انگلیسی  تغییر می‌ده.

## مشکل ۲: سخت بودن تغییر زبان

- سخت بودن تغییر زبان مشکلیه که موقع نوشتن متن‌های دوزبانه خیلی اذیت می‌کنه.
- این اسکریپت دکمه‌ی بی‌کاربرد CapsLock رو به این کار اختصاص می‌ده. با زدن CapsLock، بین زبان‌ها می‌تونید بچرخید. (البته CapsLock رو هم می‌تونید روشن و خاموش کنید!)
- یه چیز دیگه هم این که MarkDown این امکان رو داره که کد‌هامون رو بین `` ` `` بنویسیم. و ما وقتی داریم به فارسی تایپ می‌کنیم و می‌خوایم کد بنویسیم، باید یه بار `` ` `` رو بزنیم، یه بار هم زبان رو عوض کنیم تا کدمون رو بنویسیم. این اسکریپت می‌تونه دکمه‌ی `` ` `` رو اختصاص بده تا زبان رو هم عوض کنه.

## مشکل ۳: نبودن دکمه‌ی Play/Pause توی بعضی از کیبوردا

- این اسکریپت Win+Space برای رو برای این کار تغییر می‌ده.

## مشکل ۴: خراب بودن شورت‌کات‌های کیبوردی Git Gui

- این اسکریپت شورت‌کات‌های مورد استفاده‌ی Git Gui مثل Ctrl+Shift+T و Ctrl+Shift+U و Ctrl+Shift+I (که فقط وقتی کار می‌کنن که روی باکس پیام کامیت باشی) رو هم درست می‌کنه.

# راهنما

## عوض کردن زبان

- اگه دکمه‌ی CapsLock رو بزنید بین زبان‌هایی که تعریف شده می‌چرخه.
- اگه Shift+CapsLock رو بزنید، بین کیبورد‌های زبانی که روش هستید می‌چرخه.
- اگه Ctrl سمت راست رو با CapsLock بزنید، کیبورد راست‌دست زبانی که روش هستید رو فعال می‌کنه.
- و اگه Ctrl سمت چپ رو با CapsLock بزنید، کیبورد چپ‌دست زبانی که روش هستید رو فعال می‌کنه.
- در ضمن، آخرین کیبوردی که توی هر زبان روش بودید رو یادش می‌مونه و وقتی برمی‌گردید همون رو فعال می‌کنه.
- نکته: کیبورد‌هایی که انتخاب می‌کنید باید به سیستمتون اضافه شده باشن، وگرنه نمی‌تونه فعالش کنه.

## فعال و غیرفعال کردن امکانات

- برای غیر فعال کردن یا دوباره فعال کردن اصلاح علامت‌های معروف کیبورد فارسی، CapsLock+\‎ رو بزنید.
- برای غیر فعال کردن یا دوباره فعال کردن تغییر زبان با دکمه‌ی `` ` `` از CapsLock+`‎ استفاده کنید.
- برای از کار انداختن یا دوباره به کار انداختن دکمه‌ی Insert هم از CapsLock+Insert استفاده کنید. (فقط خود Insert از کار می‌افته و ترکیب‌هاش مثل Ctrl+Insert سر جاشون هستن.)
- از CapsLock+Tab هم می‌تونید برای روشن و خاموش کردن خود CapsLock استفاده کنید.

## سایر امکانات

- برای Play یا Pause کردن پلیرتون می‌تونید از Win+Space استفاده کنید. (توی بعضی پلیر‌ها باید فعال کنید این رو توی نتظیماتش.)
- توی Git Gui:
  - از Ctrl+Shift+T برای اضافه کردن فایل جاری به ایندکس استفاده کنید.
  - از Ctrl+Shift+U برای حذف فایل جاری از ایندکس استفاده کنید.
  - از Ctrl+Shift+I برای اضافه کردن همه‌ی تغییرات به ایندکس استفاده کنید.

## تنظیمات اولیه‌ی اسکریپت

- اگه فایل Config.ahk رو با یه ویرایشگر متنی باز کنید، تنظیمات اسکریپت اون‌جاس. می‌تونید این چیزا رو مشخص کنید:
  - زبان‌هاتون و کیبورد‌های هر کدوم از زبان‌ها.
  - وضعیت اولیه‌ی فعال یا غیر فعال بودن هر کدوم از امکانات.
  - فعال یا غیرفعال بودن شورت‌کات‌های اصلاح شده‌ی Git Gui.
  - فعال یا غیرفعال بودن دکمه‌ی Play/Pause.
- درباره‌ی تغییر دادن زبان‌ها:
  - متغیر `KeyboardsData` داخلش اطلاعات زبان‌ها و کیبورد‌هاتون رو نگه می‌داره. (به خط اول و آخرش دست نزنید.)
  - برای هر زبانی سه دسته کیبورد می‌تونید تعریف کنید:
    - یه دسته کیبورد‌های Normal که کیبورد‌های پیش‌فرضن و با Shift+CapsLock می‌تونید بینشون بچرخید.
    - دو تا دسته‌ی دیگه هم Left و Right ن که با Ctrl+CapsLock می‌تونید بینشون بچرخید.
  - اگه می‌خواید کیبورد دیگه‌ای اضافه کنید، باید عددش رو بدونید. می‌تونید وقتی اون کیبورد فعاله، Alt+CapsLock رو بزنید تا عدد مربوط به کیبوردتون رو نشونتون بده. (فقط نمی‌دونم چرا باید دو بار بزنید! دفعه‌ی اول عدد کیبورد قبلی رو نشون می‌ده، دفعه‌ی دوم عدد کیبورد فعلی رو...!)
