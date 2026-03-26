# Sysroot Support in Swift's `build-script` for Cross-Compilation Targets

**Personal**

Name: Xaver Gruber  
Email: xaver.max.gruber@gmail.com  
Github: https://github.com/xavgru12  
Linkedin: linkedin.com/in/ingenieur-xaver-gruber-639a4b18a  
Degree Program: Final year of MSc in Computer Science at IU  
Job: Embedded Software Engineer  
Country: Switzerland  
 
I am experienced in developing and maintaining build systems with CMake and Python.
I have been following the Swift project closely, with a particular interest in cross-compiling Swift where I have built [good connections](https://xtremekforever.substack.com/p/introduction-to-building-swift-for) within the community.

**Motivation**

The common approach to building Swift for Linux is native compilation, where
the host and target are identical.  Cross-compilation enables a single host
system to build for multiple targets by providing sysroots and generate Swift
SDKs.  It also allows targeting environments where native builds are
impractical, such as minimal, constrained, older, or specialized distributions.
This project builds on existing Wasm cross-compilation mechanisms generalizing
sysroot support in `build-script`. It enables support for more targets and
strengthens the extensibility and sustainability of Swift’s build
infrastructure.

**Description**

Extend Swift‘s `build-script` with an experimental flag which provides the path
to the sysroot of the target triple used when cross-compiling core libraries
(not the Swift toolchain). This enables [cross-compilation
targets](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0387-cross-compilation-destinations.md)
with other sysroots.
[Wasm](https://github.com/swiftlang/swift/blob/main/utils/swift_build_support/swift_build_support/products/wasmswiftsdk.py)
already uses a
[sysroot](https://github.com/swiftlang/swift/blob/main/utils/swift_build_support/swift_build_support/products/wasisysroot.py),
the approach is to generalize the mechanism by splitting out the Swift core
library builds into separate build products to be used for cross-compilation to
other target platforms. This idea is narrowly limited in scope to
cross-compilation of Swift core libraries, cross-compiled Swift toolchains
handled by `--cross-compile-hosts` option are out of scope.


**Expected outcomes/benefits/deliverables**
- New build products for cross-compiling Swift core libraries (reuse from Wasm).
- The new experimental flag from `build-script` is propagated to the new build products.
- Cross-compilation of core libraries succeeds and tests run successfully on target system.
- Benefit is to enable cross-compilation of Swift packages to more operating systems that use sysroots
    previously not supported end-to-end by Swift SDKs.


**Mentors**

- [Max Desiatov](https://github.com/MaxDesiatov)
- [Yuta Saito](https://github.com/kateinoigakukun)

<div style="page-break-after: always;"></div>

**Timeline**

Start date: May 25  
Midterm evaluation deadline: July 10  
End date: August 24  

- **Week 1:** Reorganize the` SwiftSDK` build product and the` WasmSwiftSDK` as a platform-specific build product that composes` SwiftSDK`.
- **Week 2:** Introduce an experimental flag to pass` sysroot` to` SwiftSDK`.  
- **Week 3:** Reorganize the` Stdlib` build product and the` WasmStdlib` as a platform-specific build product that composes` Stdlib`.  
- **Week 4:** Implement the` LinuxSwiftSDK` as a platform-specific class that composes` SwiftSDK`.
- **Week 5:** Implement the` LinuxStdlib` as a platform-specific build product that composes `Stdlib`, configure the necessary CMake options and declare its dependencies.
- **Week 6:** Produce midterm documentation: publish a blog post on Swift Forums and begin drafting documentation in` docs/LinuxCrossCompile.md`.  
- **Week 7:** Implement the` Libdispatch` build product and the` LinuxLibdispatch` as a platform-specific build product that composes` Libdispatch` and declare its dependencies
- **Weeks 8-9:** Establish and execute compiler tests from` run-test` using the` run-target` option for the Linux platform. 
- **Week 10:** Split out the Foundation build from` SwiftSDK` into a dedicated build product and declare its dependencies. 
- **Week 11:** Split out XCTest and Swift testing builds from` SwiftSDK` into distinct build products and declare their dependencies.  
- **Week 12:** Finalize and consolidate all documentation.  

