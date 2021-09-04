#include <Windows.h>

void start();
int random();
LRESULT CALLBACK msgBoxHook(int nCode, WPARAM wParam, LPARAM lParam);
HCRYPTPROV prov;

#define ERROR_COUNT 2248

void initErrors();
unsigned short errorIds[ERROR_COUNT];

const unsigned char errorData[] = {
	0, 161, 3, 2, 129, 11, 150, 8, 2, 135, 11, 133, 2, 135, 3, 139,
	2, 160, 2, 3, 3, 129, 2, 129, 6, 3, 3, 129, 9, 129, 2, 129,
	3, 2, 133, 2, 2, 129, 5, 134, 3, 133, 6, 14, 129, 4, 7, 129,
	8, 131, 4, 6, 10, 146, 2, 134, 2, 145, 7, 131, 47, 131, 80, 1,
	4, 13, 34, 155, 2, 135, 7, 3, 136, 5, 4, 136, 2, 129, 3, 129,
	2, 135, 4, 132, 3, 4, 2, 129, 2, 131, 2, 129, 2, 130, 2, 129,
	3, 8, 3, 133, 5, 3, 131, 4, 137, 4, 13, 7, 130, 2, 130, 2,
	129, 10, 133, 2, 141, 2, 147, 3, 3, 4, 143, 2, 122, 2, 133, 2,
	149, 29, 161, 16, 147, 3, 138, 8, 130, 8, 151, 2, 134, 9, 129, 9,
	193, 1, 6, 2, 140, 2, 179, 2, 220, 1, 2, 132, 2, 130, 2, 155,
	29, 131, 47, 130, 49, 182, 65, 2, 134, 2, 141, 2, 137, 85, 1, 136,
	10, 130, 9, 136, 62, 133, 5, 141, 85, 1, 129, 93, 1, 48, 87, 2,
	129, 2, 84, 9, 150, 28, 68, 14, 50, 134, 94, 1, 100, 1, 142, 36,
	131, 47, 169, 9, 130, 38, 132, 6, 132, 16, 134, 14, 131, 57, 117, 7,
	181, 2, 162, 96, 12, 210, 1, 28, 150, 96, 1, 98, 7, 176, 52, 159,
	69, 1, 131, 2, 135, 2, 169, 82, 2, 144, 5, 131, 10, 2, 129, 2,
	130, 2, 129, 4, 140, 3, 2, 132, 106, 17, 150, 2, 167, 38, 145, 2,
	247, 2, 2, 163, 2, 146, 3, 213, 1, 64, 68, 151, 74, 12, 181, 3,
	167, 2, 138, 2, 136, 7, 135, 68, 1, 179, 2, 185, 122, 13, 130, 2,
	129, 2, 139, 2, 130, 3, 131, 3, 2, 130, 2, 129, 42, 133, 15, 136,
	2, 140, 4, 129, 8, 140, 53, 130, 2, 131, 43, 49, 130, 20, 134, 73,
	1, 133, 96, 1, 99, 1, 154, 110, 2, 146, 23,
};

void initErrors() {
	int i = 0, d = 0, o = 0;
	for (; d < sizeof(errorData); d++) {
		unsigned char b = errorData[d];

		short n = b & 63;
		if (b & 64)
			n |= errorData[++d] << 6;

		if (b & 128) {
			int s = i + n;
			for (; i < s; i++) {
				errorIds[i] = ++o;
			}
		}
		else {
			o += n;
			errorIds[i++] = o;
		}
	}
}

int random() {
	if (prov == NULL)
		if (!CryptAcquireContext(&prov, NULL, NULL, PROV_RSA_FULL, CRYPT_SILENT | CRYPT_VERIFYCONTEXT))
			ExitProcess(1);

	int out;
	CryptGenRandom(prov, sizeof(out), (BYTE *)(&out));
	return out & 0x7fffffff;
}
void start() {
	initErrors();
	HHOOK hook = SetWindowsHookEx(WH_CBT, msgBoxHook, 0, GetCurrentThreadId());
	LPWSTR msg = (LPWSTR)LocalAlloc(LMEM_ZEROINIT, 8192*sizeof(WCHAR));

	FormatMessageW(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, NULL,
		errorIds[random() % ERROR_COUNT], MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), msg, 8192, NULL);

	MessageBoxW(NULL, msg, L"Microsoft Windows", MB_OK);
	LocalFree(msg);

	UnhookWindowsHookEx(hook);
	ExitProcess(0);
}

LRESULT CALLBACK msgBoxHook(int nCode, WPARAM wParam, LPARAM lParam) {
	if (nCode == HCBT_CREATEWND) {
		CREATESTRUCT *pcs = ((CBT_CREATEWND *)lParam)->lpcs;

		if ((pcs->style & WS_DLGFRAME) || (pcs->style & WS_POPUP)) {
			HWND hwnd = (HWND)wParam;

			int x = random() % (GetSystemMetrics(SM_CXSCREEN) - pcs->cx);
			int y = random() % (GetSystemMetrics(SM_CYSCREEN) - pcs->cy);

			pcs->x = x;
			pcs->y = y;
		}
	}

	return CallNextHookEx(0, nCode, wParam, lParam);
}
