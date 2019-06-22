#include <Windows.h>

void start();
DWORD WINAPI soundThread(LPVOID parameter);
int random();

BOOL endofsound = FALSE;
HCRYPTPROV prov;

void start() {
	if (!CryptAcquireContext(&prov, NULL, NULL, PROV_RSA_FULL, CRYPT_SILENT | CRYPT_VERIFYCONTEXT))
		ExitProcess(1);

	CreateThread(NULL, 0, &soundThread, NULL, 0, NULL);

	HWND desktop = GetDesktopWindow();
	HDC dc = GetWindowDC(desktop);

	RECT rekt;
	GetWindowRect(desktop, &rekt);

	int w = rekt.right - rekt.left;
	int h = rekt.bottom - rekt.top;

	while (!endofsound) {
                    HBITMAP screenshot = CreateCompatibleBitmap(dc, w, h);
	          HDC dc2 = CreateCompatibleDC(dc);
	          SelectObject(dc2, screenshot);
		BitBlt(dc2, 0, 0, w, h, dc, 0, 0, SRCCOPY);
		BitBlt(dc, 0, 0, w, h, dc2, (random() % 6) - 3, (random() % 6) - 3, SRCCOPY);
		Sleep(50);
		BitBlt(dc, 0, 0, w, h, dc2, 0, 0, SRCCOPY);
		Sleep(50);
	}

	ExitProcess(0);
}

DWORD WINAPI soundThread(LPVOID parameter) {
	for(int i=0; i < 1000; i++) {Sleep(1);}
	endofsound = TRUE;
	return 0;
}

int random() {
	int out;
	CryptGenRandom(prov, sizeof(out), (BYTE *)(&out));
	return out & 0x7fffffff;
}