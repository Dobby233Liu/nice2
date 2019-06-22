#include <Windows.h>

void start();
int random();

BOOL endofsound = FALSE;
HCRYPTPROV prov;

void start() {
	int nothing = 0;
	if (!CryptAcquireContext(&prov, NULL, NULL, PROV_RSA_FULL, CRYPT_SILENT | CRYPT_VERIFYCONTEXT))
		ExitProcess(1);

	HWND desktop = GetDesktopWindow();
	HDC dc = GetWindowDC(desktop);

	RECT rekt;
	GetWindowRect(desktop, &rekt);

	int w = rekt.right - rekt.left;
	int h = rekt.bottom - rekt.top;
	HBITMAP screenshot;
	HDC dc2;
	while(nothing < 2550 * 4 / 50){
		screenshot = CreateCompatibleBitmap(dc, w, h);
	          dc2 = CreateCompatibleDC(dc);
	          SelectObject(dc2, screenshot);
		BitBlt(dc2, 0, 0, w, h, dc, 0, 0, SRCCOPY);
		BitBlt(dc, 0, 0, w, h, dc2, (random() % 4), (random() % 4), SRCCOPY);
		Sleep(50);
		BitBlt(dc, 0, 0, w, h, dc2, 0, 0, SRCCOPY);
		Sleep(50);
		// int xPower = 4;
		// int yPower = 0;
		// BitBlt(dc, xPower > 0 ? xPower : 0, yPower > 0 ? yPower : 0, w-abs(xPower), h-abs(yPower), dc, xPower < 0 ? -xPower : 0, yPower < 0 ? -yPower : 0, SRCCOPY);
		// BitBlt(dc, xPower < 0 ? w + xPower : 0, 0, abs(xPower), h, dc2, xPower > 0 ? w - xPower : 0, 0, SRCCOPY);
		// BitBlt(dc, 0, yPower < 0 ? h + yPower : 0, w, abs(yPower), dc2, 0, yPower > 0 ? h - yPower : 0, SRCCOPY);
		nothing += 1;
	}
	DeleteDC(dc2);
	DeleteObject(screenshot);

	ExitProcess(0);
}

int random() {
	int out;
	CryptGenRandom(prov, sizeof(out), (BYTE *)(&out));
	return out & 0x7fffffff;
}