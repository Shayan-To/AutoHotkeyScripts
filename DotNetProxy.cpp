// Compile with 'cl /clr /LD' on an x64 command prompt (or x86, based on AutoHotKey version).

#include <vcclr.h>
#include <cwchar>

#using <mscorlib.dll>
#using <System.dll>
#using <System.Windows.Forms.dll>

using namespace System;
using namespace System::Threading;
using namespace System::Reflection;
using namespace System::Windows::Forms;

ref class Globals
{

	static Globals()
	{
		app_thread = gcnew Thread(gcnew ThreadStart(app_func));
		app_thread->ApartmentState = ApartmentState::STA;
		app_thread->Start();
	}

	static void app_func()
	{
		//control = gcnew Control;
		form = gcnew Form;
		//form->Click += gcnew EventHandler(click);
		Form::typeid->GetMethod("CreateHandle", BindingFlags::NonPublic | BindingFlags::Instance)
			->Invoke(form, gcnew array<Object ^>(0));
		form->BeginInvoke(gcnew Action(form, &Form::Hide));
		Application::Run(form);
	}

	//static void click(Object ^s, EventArgs ^e)
	//{
	//	auto langs = InputLanguage::InstalledInputLanguages;
	//	InputLanguage::CurrentInputLanguage = langs[rand->Next(langs->Count)];
	//}

public:
	static void SetLanguage(InputLanguage ^lang)
	{
		form->Show();
		form->Activate();
		InputLanguage::CurrentInputLanguage = lang;
		form->Hide();
	}

	static initonly Random ^rand = gcnew Random;
	static initonly Thread ^app_thread;
	static Form ^form;

};

extern "C" __declspec(dllexport) bool SetLanguage(int lang)
{
	auto langs = InputLanguage::InstalledInputLanguages;
	for (int i = 0; i < langs->Count; i++)
	{
		if ((int)langs[i]->Handle == lang)
		{
			Globals::form->BeginInvoke(gcnew Action<InputLanguage ^>(Globals::SetLanguage), langs[i]);
			return 1;
		}
	}
	return 0;
}

wchar_t *tmp_str = new wchar_t[100];

extern "C" __declspec(dllexport) wchar_t *GetName(int lang)
{
	auto langs = InputLanguage::InstalledInputLanguages;
	for (int i = 0; i < langs->Count; i++)
	{
		if ((int)langs[i]->Handle == lang)
		{
			auto name = langs[i]->LayoutName;
			pin_ptr<wchar_t const> cname = PtrToStringChars(name);
			wcscpy_s(tmp_str, 100, cname);
			return tmp_str;
		}
	}
	tmp_str[0] = 0;
	return tmp_str;
}

// https://www.codeproject.com/articles/19354/quick-c-cli-learn-c-cli-in-less-than-minutes
// https://docs.microsoft.com/en-us/cpp/dotnet/how-to-convert-system-string-to-wchar-t-star-or-char-star
// https://autohotkey.com/board/topic/16357-intergrating-c-and-ahk-is-it-possible/
// https://autohotkey.com/board/topic/18653-dllcall-net-assemblies/
// https://autohotkey.com/board/topic/23884-net-framework-interop/
// https://autohotkey.com/board/topic/22247-using-a-c-library-from-ahk/
// https://docs.microsoft.com/en-us/cpp/build/walkthrough-creating-and-using-a-dynamic-link-library-cpp
