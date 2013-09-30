#include <Windows.h>
#include <stdio.h>


int main(int argc, LPSTR *argv){
	
	TCHAR lpDirectory[MAX_PATH];
	WIN32_FIND_DATAW stFind;
	HANDLE hFind = NULL;
	
	SetCurrentDirectoryW(TEXT("./ttt"));
	GetCurrentDirectory(sizeof(lpDirectory), lpDirectory);
	wprintf(TEXT("%s\n"), lpDirectory); 

	hFind = FindFirstFileW(TEXT("*.txt"), &stFind);
	if(hFind == INVALID_HANDLE_VALUE){
		printf("Error: %d\n", GetLastError());
		ExitProcess(1);
	}
	
	do{
		wprintf(TEXT("[+] %s\n"), stFind.cFileName);
	}while(FindNextFile(hFind, &stFind));

	if(GetLastError() == ERROR_NO_MORE_FILES){
		printf("[+] No more files found\n");
	} else {
		printf("[-] Something other went wrong\n");
	}

	FindClose(hFind);
	return 0;
}