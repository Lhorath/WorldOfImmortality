
# World of Immortality — Windows Installation & Compilation Guide

## 1. Windows (`How-to:Win` — February 2011 source lineage)

This guide is adapted for the **World of Immortality** repository:

- **Repository:** https://github.com/Lhorath/WorldOfImmortality
- **Default branch:** `main`
- **Original TrinityCore fork date:** February 4, 2011

The instructions below retain the historical compiler, database, and library versions from the archived guide wherever the repository's build configuration does not establish a different requirement.

## Software & Dependencies Required

- **Compiler:** Microsoft Visual C++ 2008 Express (VC90) or Visual Studio 2008 / 2010.
- **Build system:** CMake **3.12 or newer**.
  - **Important:** The repository's root `CMakeLists.txt` specifies `cmake_minimum_required(VERSION 3.12)`. The archived guide's CMake 2.8.x requirement is therefore too old for this repository.
- **Source control:** Git, optionally with TortoiseGit or Git Extensions.
- **Database:** MySQL Community Server 5.1.x or 5.5.x, including the development headers and client library required by CMake.
- **Libraries:** OpenSSL 0.9.8x — the archived guide identifies Win32 OpenSSL v0.9.8q as the historical choice for the VC90-era toolchain.
  - Keep the OpenSSL architecture (Win32/x86 or x64) consistent with the selected Visual Studio build configuration.
  - The repository's CMake finder recognizes legacy OpenSSL library names such as `libeay32` and `ssleay32`. Do not assume a modern OpenSSL release is a drop-in replacement; validate compatibility before substituting one.

### Dependencies Bundled with the Repository

The repository contains several dependencies, so separate installations or manual builds are generally not needed for these components when using the Windows build configuration:

- **ACE:** bundled under `dep/acelite`.
- **G3D:** bundled under `dep/g3dlite`.
- **gSOAP:** bundled under `dep/gsoap`.
- **zlib:** bundled under `dep/zlib`.

The build configuration also contains bundled components such as libmpq and other supporting libraries. The CMake configuration determines which components are built and linked for the selected targets.

### MySQL Development Files

A MySQL server installation alone may not be sufficient. CMake must be able to locate the MySQL development components, including:

- `mysql.h`
- The matching MySQL client library (`libmysql.lib` or the equivalent library supplied by the selected MySQL package)

The repository's MySQL finder contains legacy Windows discovery logic for MySQL 5.0, 5.1, and 5.5-era installations. Use a matching development package and ensure its architecture matches the build configuration.

## Step-by-Step Compilation

### 1. Pulling the Source

1. Create a source directory, for example:

   `C:\WorldOfImmortality`

2. Clone the repository:

   ```text
   https://github.com/Lhorath/WorldOfImmortality.git
   ```

3. Check out the `main` branch if Git did not select it automatically.

### 2. Configuring with CMake

1. Create a separate build directory, for example:

   `C:\Build`

2. Open **CMake GUI**.

3. Set the source and build directories:

   - **Where is the source code:** `C:/WorldOfImmortality`
   - **Where to build the binaries:** `C:/Build`

4. Click **Configure**.

5. Select the Visual Studio generator matching the compiler you intend to use:

   - Visual Studio 9 2008
   - Visual Studio 10

6. Select the correct platform (Win32 or x64) to match the architecture of your MySQL and OpenSSL libraries.

7. Review the available CMake options:

   - `SERVERS`: enabled by default; builds the server components.
   - `SCRIPTS`: enabled by default; includes the script system and bundled script groups.
   - `TOOLS`: disabled by default; enable it if you also want the repository's extraction/tool targets.
   - `USE_COREPCH` and `USE_SCRIPTPCH`: precompiled headers are enabled by default.

8. Click **Configure** again until CMake finishes without unresolved required dependency errors.

9. Click **Generate** to create the Visual Studio solution.

   The project is named `TrinityCore` internally, so the generated solution is expected to be named:

   `C:\Build\TrinityCore.sln`

   If CMake reports that it cannot find MySQL or OpenSSL, verify the corresponding include directories, libraries, and architecture before generating the solution.

### 3. Compiling

1. Open:

   `C:\Build\TrinityCore.sln`

2. In Visual Studio, select the **Release** configuration.

3. Select the platform matching the architecture used when configuring CMake and the installed MySQL/OpenSSL libraries.

4. In Solution Explorer, right-click **ALL_BUILD** and select **Build** (or press `F7`).

5. Allow the build to finish. Resolve any missing dependency or compiler errors before proceeding.

### 4. Gathering Binaries and Runtime Libraries

The server targets are:

- `authserver.exe`
- `worldserver.exe`

For a standard Visual Studio Release build, the expected output directory is:

`C:\Build\bin\Release\`

The exact output path can vary with the selected generator and platform configuration (for example, some Visual Studio generators include an additional platform/configuration directory).

The repository's Windows CMake rules copy the server configuration templates into the build output directory:

- `authserver.conf.dist`
- `worldserver.conf.dist`

Make working copies of these files and rename the copies:

- `authserver.conf`
- `worldserver.conf`

#### Runtime DLLs

Ensure that the runtime DLLs required by the selected MySQL and OpenSSL builds are available beside the server executables or through the Windows DLL search path.

For the legacy dependency versions described above, this may include:

- The MySQL client runtime DLL supplied with the installed MySQL package.
- `libeay32.dll` and `ssleay32.dll` supplied with the selected legacy OpenSSL package.

Use the actual DLL names supplied by the dependency packages and required by the linked libraries. Do not copy an `ACE.dll` based solely on the archived guide: this repository builds its bundled ACE source from `dep/acelite`, and the build configuration should determine whether a separate ACE runtime DLL is produced or required.

## Build Configuration Notes

- The root CMake project explicitly requires CMake 3.12 or newer, even though the codebase and original instructions date from the 2011 era.
- The project retains compiler-compatibility code for older Microsoft Visual C++ toolchains. The source inspected does not establish a requirement for a modern C++ language standard.
- The bundled dependency directories should be used rather than independently downloading newer versions of those libraries.
- Keep compiler, MySQL, OpenSSL, and target architectures consistent. Mixing Win32 libraries with an x64 build (or vice versa) will cause configuration or linking failures.
- `TOOLS` is optional. The server build does not require enabling it unless you also need the extraction utilities.
- This guide covers Windows installation and compilation only.
